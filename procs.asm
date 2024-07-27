draw_clock proc
    call draw_marks

    movLower8 color, white

    mov clock.x, 0
    mov clock.y, 3
    mov clock.r, 3
    call draw_circle

    mov clock.x, 0
    mov clock.y, 230
    mov clock.r, 230
    call draw_circle
    
    mov clock.x, 0
    mov clock.y, 170
    mov clock.r, 170
    call draw_circle

    ; numbers
    call draw_clock_digits

    ret
draw_clock endp

draw_sec_arrow proc
    movLower8 color, red
    
    mov arrow.x0, 0
    mov arrow.y0, 0
    arrToVar arrow.x, array_sec, index_sec
    inc index_sec
    arrToVar arrow.y, array_sec, index_sec
    dec index_sec
    mov arrow.width, 1
    call draw_arrow

ret
draw_sec_arrow endp
draw_min_arrow proc
    movLower8 color, blue
    
    mov arrow.x0, 0
    mov arrow.y0, 0
    arrToVar arrow.x, array_min, index_min
    inc index_min
    arrToVar arrow.y, array_min, index_min
    dec index_min
    mov arrow.width, 2
    call draw_arrow

ret
draw_min_arrow endp
draw_hour_arrow proc
    
    movLower8 color, green
    mov arrow.x0, 0
    mov arrow.y0, 0
    arrToVar arrow.x, array_hour, index_hour
    inc index_hour
    arrToVar arrow.y, array_hour, index_hour
    dec index_hour
    mov arrow.width, 3
    call draw_arrow

ret
draw_hour_arrow endp

erase_arrows proc
    movLower8 color, black
    mov arrow.x0, 0
    mov arrow.y0, 0
    arrToVar arrow.x, array_hour, index_hour
    inc index_hour
    arrToVar arrow.y, array_hour, index_hour
    mov arrow.width, 3
    call draw_arrow

    movLower8 color, black
    mov arrow.x0, 0
    mov arrow.y0, 0
    arrToVar arrow.x, array_min, index_min
    inc index_min
    arrToVar arrow.y, array_min, index_min
    mov arrow.width, 2
    call draw_arrow
    
    movLower8 color, black
    mov arrow.x0, 0
    mov arrow.y0, 0
    arrToVar arrow.x, array_sec, index_sec
    inc index_sec
    arrToVar arrow.y, array_sec, index_sec
    mov arrow.width, 1
    call draw_arrow
    ret
erase_arrows endp

draw_arrow_pixel proc
    mov ax, arrow.width
    mov bx, 2
    xor dx, dx
    idiv bx
    sub arrow.x0, dx
    add arrow.y0, dx

    mov16 i, arrow.width
row_loop:    
    mov16 j, arrow.width
colum_loop:
    mov16 drawX, arrow.x0
    mov16 drawY, arrow.y0
    call draw_pixel
    inc arrow.x0

    dec j
    cmp j, 0
    jnz colum_loop

    dec arrow.y0
    sub_ arrow.x0, arrow.width
    dec i
    cmp i, 0
    jnz row_loop
row_loop_end:
    ret
draw_arrow_pixel endp

draw_arrow proc
    ; delta_x
    ; int 3
    mov ax, arrow.x
    sub ax, arrow.x0
    mov arrow.delta_x, ax
    mov bx, arrow.delta_x
    call abc
    mov arrow.delta_x, bx

    ; direction x
    cmp ax, 0
    jz dx0
    cmp ax, 0
    jl dxminus1 
    mov arrow.signX, 1
    jmp dx_next
dx0:
    mov arrow.signX, 0
    jmp dx_next
dxminus1:
    mov arrow.signX, -1
dx_next:

    ; delta_y
    mov ax, arrow.y
    sub ax, arrow.y0
    mov arrow.delta_y, ax
    mov bx, arrow.delta_y
    call abc
    mov arrow.delta_y, bx
    neg arrow.delta_y

    ; direction y
    cmp ax, 0
    jz dy0
    cmp ax, 0
    jl dyminus1
    mov arrow.signY, 1
    jmp dy_next
dyminus1:
    mov arrow.signY, -1
    jmp dy_next
dy0:
    mov arrow.signY, 0
dy_next:
    ; error
    mov ax, arrow.delta_x
    add ax, arrow.delta_y
    mov arrow.error, ax

arrow_loop:
    ; int 3
    mov16 drawX, arrow.x0
    mov16 drawY, arrow.y0
    push arrow.x0
    push arrow.y0
    cmp arrow.width, 1
    jz equal1 
more1:
    call draw_arrow_pixel
    jmp width_next
equal1:
    call draw_pixel
width_next:
    pop arrow.y0
    pop arrow.x0
    ; изменяем координаты и снова рисуем пиксель

; x0=x and y0=y
    cmp_ arrow.x0, arrow.x
    jnz skip
    cmp_ arrow.y0, arrow.y
    jnz skip
    jmp arrow_loop_end
skip:
    mov ax, arrow.error
    mov bx, 2
    imul bx
    mov arrow.error2, ax

    cmp_ arrow.error2, arrow.delta_y
    jge horizontal
    jmp not_horizontal
horizontal:
    add_ arrow.error, arrow.delta_y
    add_ arrow.x0, arrow.signX
not_horizontal:
    cmp_ arrow.error2, arrow.delta_x
    jl vertical
    jmp not_vertical
vertical:
    add_ arrow.error, arrow.delta_x
    add_ arrow.y0, arrow.signY
not_vertical:
    jmp arrow_loop
arrow_loop_end:
    mov arrow.x0, 0
    mov arrow.y0, 0
    ret
draw_arrow endp

draw_decimal proc	
	push ax
	push bx
	push cx
	push dx
	mov bx, 10    ; десятичная система счисления
	mov dx, 0     ; остаток от деления будет храниться здесь
	mov ax, value ; загружаем десятичное число
	mov cx, 0     ; счетчик цифр числа
	cmp ax, 0     ; проверяем, не равно ли число нулю
	jne skip_check
	mov dl, '0'   ; если число ноль, выводим единственный символ '0'
	mov ah, 02h   ; функция вывода символа с атрибутом
	int 21h
	jmp end_draw_decimal
    skip_check:
    process_digit:
	idiv bx        ; делим число на 10
	add dl, '0'   ; преобразуем остаток в символ
	push dx       ; сохраняем символ в стеке
	inc cx        ; увеличиваем счетчик цифр
	mov dx, 0     ; обнуляем остаток
	cmp ax, 0     ; проверяем, не равно ли частное нулю
	jne process_digit
    print_digits:
	pop dx        ; извлекаем цифру из стека
	mov ah, 02h   ; функция вывода символа с атрибутом
	int 21h
	loop print_digits
    end_draw_decimal:
	pop dx
	pop cx
	pop bx
	pop ax
    ret
draw_decimal endp

draw_digit proc
    pushall
    add value, '0'
    mov bh, 0
    mov cx, 1
    mov al, byte ptr value
    mov bl, color
    mov ah, 09h
    int 10h
    popall
ret
draw_digit endp


convert_coords proc
    add_ drawX, winW_ctr
    mov ax, drawY
    mov16 drawY, winH_ctr
    sub drawY, ax
    xor ax, ax
    ret
convert_coords endp

draw_pixel proc
    call convert_coords
    mov al, color  ; цвет
    mov ah, 0Ch    ; писать пиксель 
    mov bh, 0      ; номер видеостраницы 
    mov cx, drawX
    mov dx, drawY
    int 10h
    ret
draw_pixel endp

draw_circle proc
    ; d = 3 - 2r
    mov ax, clock.r
    mov bx, 2
    imul bx
    mov16 clock.d, 3
    sub clock.d, ax
@1:
    ; пока x <= y
    mov ax, clock.x
    mov bx, clock.y
    cmp ax, bx
    jg quit

    call draw_8_pixels

    ; d <= 0
    cmp clock.d, 0
    jle change_d

    ; d > 0
    ; d = d + 4*(x - y) + 10
    mov ax, clock.x
    sub ax, clock.y
    shl ax, 2     ; умножение на 4
    add ax, clock.d
    add ax, 10
    mov clock.d, ax
    dec clock.y
    jmp @next_step

change_d:
    ; d = d + 4*x + 6
    mov ax, clock.x
    shl ax, 2     ; умножение на 4
    add ax, clock.d
    add ax, 6
    mov clock.d, ax

@next_step:
    inc clock.x
    jmp @1

quit:
    ret
draw_circle endp

set_cursor proc
    mov ah, 02h         ; устанавливает позицию курсора.
    mov bh, 0           ; видео страница
    mov dh, cursorY     ; номер строки (считая от 0)
    mov dl, cursorX     ; номер столбца (считая от 0)
    int 10h
ret
set_cursor endp

draw_8_pixels proc
    ; (x0 + x, y0 + y)
    mov ax, clock.x0
    add ax, clock.x
    mov drawX, ax
    mov ax, clock.y0
    add ax, clock.y
    mov drawY, ax
    call draw_pixel

    ; (x0 - x, y0 + y)
    mov ax, clock.x0
    sub ax, clock.x
    mov drawX, ax
    mov ax, clock.y0
    add ax, clock.y
    mov drawY, ax
    call draw_pixel

    ; (x0 + x, y0 - y)
    mov ax, clock.x0
    add ax, clock.x
    mov drawX, ax
    mov ax, clock.y0
    sub ax, clock.y
    mov drawY, ax
    call draw_pixel

    ; (x0 - x, y0 - y)
    mov ax, clock.x0
    sub ax, clock.x
    mov drawX, ax
    mov ax, clock.y0
    sub ax, clock.y
    mov drawY, ax
    call draw_pixel

    ; (x0 + y, y0 + x)
    mov ax, clock.x0
    add ax, clock.y
    mov drawX, ax
    mov ax, clock.y0
    add ax, clock.x
    mov drawY, ax
    call draw_pixel

    ; (x0 - y, y0 + x)
    mov ax, clock.x0
    sub ax, clock.y
    mov drawX, ax
    mov ax, clock.y0
    add ax, clock.x
    mov drawY, ax
    call draw_pixel

    ; (x0 + y, y0 - x)
    mov ax, clock.x0
    add ax, clock.y
    mov drawX, ax
    mov ax, clock.y0
    sub ax, clock.x
    mov drawY, ax
    call draw_pixel

    ; (x0 - y, y0 - x)
    mov ax, clock.x0
    sub ax, clock.y
    mov drawX, ax
    mov ax, clock.y0
    sub ax, clock.x
    mov drawY, ax
    call draw_pixel

    ret
draw_8_pixels endp

abc proc
label0:
    neg bx
    js label0
ret
abc endp

draw_clock_digits proc
    mov16 value, 1     
    movLower8 cursorX, 77 
    movLower8 cursorY, 12 
    call set_cursor         
    call draw_decimal
    mov16 value, 2      
    movLower8 cursorX, 86 
    movLower8 cursorY, 17 
    call set_cursor         
    call draw_decimal
    mov16 value, 3      
    movLower8 cursorX, 90 
    movLower8 cursorY, 23 
    call set_cursor         
    call draw_decimal
    mov16 value, 4     
    movLower8 cursorX, 87 
    movLower8 cursorY, 30 
    call set_cursor         
    call draw_decimal
    mov16 value, 5      
    movLower8 cursorX, 77 
    movLower8 cursorY, 35 
    call set_cursor         
    call draw_decimal
    mov16 value, 6
    movLower8 cursorX, 64 
    movLower8 cursorY, 37 
    call set_cursor         
    call draw_decimal
    mov16 value, 7
    movLower8 cursorX, 50 
    movLower8 cursorY, 35 
    call set_cursor         
    call draw_decimal
    mov16 value, 8
    movLower8 cursorX, 40 
    movLower8 cursorY, 30 
    call set_cursor         
    call draw_decimal
    mov16 value, 9
    movLower8 cursorX, 37 
    movLower8 cursorY, 23 
    call set_cursor         
    call draw_decimal
    mov16 value, 10
    movLower8 cursorX, 40 
    movLower8 cursorY, 17
    call set_cursor         
    call draw_decimal
    mov16 value, 11
    movLower8 cursorX, 50 
    movLower8 cursorY, 12 
    call set_cursor         
    call draw_decimal
    mov16 value, 12
    movLower8 cursorX, 63
    movLower8 cursorY, 10 
    call set_cursor         
    call draw_decimal
ret
draw_clock_digits endp

draw_marks proc
    mov arrow.width, 1

    mov index_mark, 0
    draw_green:
    mov arrow.x0, 0
    mov arrow.y0, 0

    ; mov index_mark, 32 проблемный
    mov bx, offset array_green    ; Загружаем базовый адрес массива array_green в регистр bx
    mov ax, index_mark            ; Загружаем индекс в регистр ax
    shl ax, 1                     ; Умножаем индекс на 2 (размер каждого элемента массива)
    add bx, ax                    ; Добавляем смещение к базовому адресу массива
    mov ax, [bx]                  ; Загружаем значение X
    mov arrow.x, ax               ; Присваиваем значение X переменной arrow.x

    mov bx, offset array_green    ; Загружаем базовый адрес массива array_green в регистр bx
    mov ax, index_mark            ; Загружаем индекс в регистр ax
    shl ax, 1                     ; Умножаем индекс на 2 (размер каждого элемента массива)
    add bx, ax                    ; Добавляем смещение к базовому адресу массива
    add bx, 2                     ; Переходим к следующему слову (координате Y)
    mov ax, [bx]                  ; Загружаем значение Y
    mov arrow.y, ax               ; Присваиваем значение Y переменной arrow.y
            
    movLower8 color, white
    call draw_arrow
    ; int 3
    add index_mark, 2
    cmp index_mark, 120
    jnz draw_green

    mov arrow.width, 1
    mov index_mark, 0
    draw_red:
    mov arrow.x0, 0
    mov arrow.y0, 0

    ; mov index_mark, 32 проблемный
    mov bx, offset array_red    ; Загружаем базовый адрес массива array_green в регистр bx
    mov ax, index_mark            ; Загружаем индекс в регистр ax
    shl ax, 1                     ; Умножаем индекс на 2 (размер каждого элемента массива)
    add bx, ax                    ; Добавляем смещение к базовому адресу массива
    mov ax, [bx]                  ; Загружаем значение X
    mov arrow.x, ax               ; Присваиваем значение X переменной arrow.x

    mov bx, offset array_red    ; Загружаем базовый адрес массива array_green в регистр bx
    mov ax, index_mark            ; Загружаем индекс в регистр ax
    shl ax, 1                     ; Умножаем индекс на 2 (размер каждого элемента массива)
    add bx, ax                    ; Добавляем смещение к базовому адресу массива
    add bx, 2                     ; Переходим к следующему слову (координате Y)
    mov ax, [bx]                  ; Загружаем значение Y
    mov arrow.y, ax               ; Присваиваем значение Y переменной arrow.y
            
    call draw_arrow
    ; int 3
    add index_mark, 2
    cmp index_mark, 24
    jnz draw_red

    mov arrow.width, 3
    mov index_mark, 0
    erase:
    call erase_marks
    ret
draw_marks endp

erase_marks proc
    mov arrow.x0, 0
    mov arrow.y0, 0

    ; mov index_mark, 32 проблемный
    mov bx, offset array_mark    ; Загружаем базовый адрес массива array_green в регистр bx
    mov ax, index_mark            ; Загружаем индекс в регистр ax
    shl ax, 1                     ; Умножаем индекс на 2 (размер каждого элемента массива)
    add bx, ax                    ; Добавляем смещение к базовому адресу массива
    mov ax, [bx]                  ; Загружаем значение X
    mov arrow.x, ax               ; Присваиваем значение X переменной arrow.x

    mov bx, offset array_mark    ; Загружаем базовый адрес массива array_green в регистр bx
    mov ax, index_mark            ; Загружаем индекс в регистр ax
    shl ax, 1                     ; Умножаем индекс на 2 (размер каждого элемента массива)
    add bx, ax                    ; Добавляем смещение к базовому адресу массива
    add bx, 2                     ; Переходим к следующему слову (координате Y)
    mov ax, [bx]                  ; Загружаем значение Y
    mov arrow.y, ax               ; Присваиваем значение Y переменной arrow.y
            
    movLower8 color, black
    call draw_arrow
    ; int 3
    add index_mark, 2
    cmp index_mark, 120
    jnz erase
    ret
erase_marks endp




