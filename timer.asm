.model small
.stack 100h
.data
isa db 'Murtazaev Isa Said-Hasanovich$'
valentin db 'Kuzichev Valentin Andreevich$'
andrew db 'Gerasimov Andrei Dmitrievich$'
vladimir db 'Kruchkov Vladimir Andreevich$'
group db 'IST-261$'
title_prog db 'ALARM!$'
 
current_hour dw 12
current_min dw 0
 
 
array_min dw 0, 140, 14, 139, 29, 136, 43, 133, 56, 127, 70, 121, 82, 113, 93, 104, 104, 93, 113, 82, 121, 70, 127, 56, 133, 43, 136, 29, 139, 14, 140, 0, 139, -14, 136, -29, 133, -43, 127, -56, 121, -69, 113, -82, 104, -93, 93, -104, 82, -113, 70, -121, 56, -127, 43, -133, 29, -136, 14, -139, 0, -140, -14, -139, -29, -136, -43, -133, -56, -127, -69, -121, -82, -113, -93, -104, -104, -93, -113, -82, -121, -70, -127, -56, -133, -43, -136, -29, -139, -14, -140, 0, -139, 14, -136, 29, -133, 43, -127, 56, -121, 69, -113, 82, -104, 93, -93, 104, -82, 113, -69, 121, -56, 127, -43, 133, -29, 136, -14, 139
array_sec dw 0, 160, 16, 159, 33, 156, 49, 152, 65, 146, 80, 138, 94, 129, 107, 118, 118, 107, 129, 94, 138, 79, 146, 65, 152, 49, 156, 33, 159, 16, 160, 0, 159, -16, 156, -33, 152, -49, 146, -65, 138, -79, 129, -94, 118, -107, 107, -118, 94, -129, 80, -138, 65, -146, 49, -152, 33, -156, 16, -159, 0, -160, -16, -159, -33, -156, -49, -152, -65, -146, -79, -138, -94, -129, -107, -118, -118, -107, -129, -94, -138, -79, -146, -65, -152, -49, -156, -33, -159, -16, -160, 0, -159, 16, -156, 33, -152, 49, -146, 65, -138, 80, -129, 94, -118, 107, -107, 118, -94, 129, -80, 138, -65, 146, -49, 152, -33, 156, -16, 159
array_hour dw 0, 100, 10, 99, 20, 97, 30, 95, 40, 91, 49, 86, 58, 80, 66, 74, 74, 66, 80, 58, 86, 49, 91, 40, 95, 30, 97, 20, 99, 10, 100, 0, 99, -10, 97, -20, 95, -30, 91, -40, 86, -49, 80, -58, 74, -66, 66, -74, 58, -80, 50, -86, 40, -91, 30, -95, 20, -97, 10, -99, 0, -100, -10, -99, -20, -97, -30, -95, -40, -91, -50, -86, -58, -80, -66, -74, -74, -66, -80, -58, -86, -50, -91, -40, -95, -30, -97, -20, -99, -10, -100, 0, -99, 10, -97, 20, -95, 30, -91, 40, -86, 49, -80, 58, -74, 66, -66, 74, -58, 80, -50, 86, -40, 91, -30, 95, -20, 97, -10, 99
array_mark dw 0, 170, 17, 169, 35, 166, 52, 161, 69, 155, 85, 147, 99, 137, 113, 126, 126, 113, 137, 99, 147, 85, 155, 69, 161, 52, 166, 35, 169, 17, 170, 0, 169, -17, 166, -35, 161, -52, 155, -69, 147, -84, 137, -99, 126, -113, 113, -126, 99, -137, 84, -147, 69, -155, 52, -161, 35, -166, 17, -169, 0, -170, -17, -169, -35, -166, -52, -161, -69, -155, -84, -147, -99, -137, -113, -126, -126, -113, -137, -99, -147, -84, -155, -69, -161, -52, -166, -35, -169, -17, -170, 0, -169, 17, -166, 35, -161, 52, -155, 69, -147, 85, -137, 99, -126, 113, -113, 126, -99, 137, -84, 147, -69, 155, -52, 161, -35, 166, -17, 169
array_green dw 18, 179, 37, 176, 55, 171, 73, 164, 105, 145, 120, 133, 133, 120, 145, 105, 164, 73, 171, 55, 176, 37, 179, 18, 179, -18, 176, -37, 171, -55, 164, -73, 145, -105, 133, -120, 120, -133, 105, -145, 73, -164, 55, -171, 37, -176, 18, -179, -18, -179, -37, -176, -55, -171, -73, -164, -105, -145, -120, -133, -133, -120, -145, -105, -164, -73, -171, -55, -176, -37, -179, -18, -179, 18, -176, 37, -171, 55, -164, 73, -145, 105, -133, 120, -120, 133, -105, 145, -73, 164, -55, 171, -37, 176, -18, 179
array_red dw 0, 200, 100, 173, 173, 99, 200, 0, 173, -99, 100, -173, 0, -200, -99, -173, -173, -99, -200, 0, -173, 100, -100, 173
 
Line struc
   x dw ?          ; х-конец
   y dw ?          ; у-конец
   x0 dw ?         ; х-начало
   y0 dw ?         ; у-начало
   delta_x dw ?
   delta_y dw ?
   signX dw 0
   signY dw 0
   error dw ?
   error2 dw ?
   width dw ?
Line ends
 
Circle struc
   x dw ?
   y dw ?
   x0 dw 0            ;x-центр окр-ти
   y0 dw 0            ;y-центр окр-ти
   r dw 200
   d dw ?              ; = 3-2r
Circle ends
 
;------Разрешение экрана------;
W dw 640
H dw 480
winW_ctr dw 512
winH_ctr dw 384
;------Цвета------;
blue db 01h
white db 0Fh
red db 04h
green db 02h
gray db 08h
black db 00h
yellow db 0Eh
foo db 06h
clock Circle <>
arrow Line <>
index_mark dw 0
 
index_hour dw 0
index_min dw 0
index_sec dw 0
 
hour dt ?
min dt ?
sec dt ?
temp dw ?
old_hour db 0
old_min db 0
old_sec db -1
 
i dw ?
j dw ?
drawX dw ?
drawY dw ?
 
value dw ?
 
cursorX db ?    ; строка курсора    max 79
cursorY db ?    ; столбец курсора   max 29
color db ?
 
;--------будильник---------
alarm_time dw 0, 0, 0, 0
alarm_color db 02H
alarm_hour dw 1
alarm_min dw 2
alarm_active db 0
selected_digit db 1 ; 0 - 3
total_digits db 4
alarm_x db 14
alarm_y db 10
index_alarm dw 0
 
;--------информация---------
 
.code
pushall macro
   push ax
   push bx
   push cx
   push dx
   push si
   push di
endm
 
popall macro
   pop di
   pop si
   pop dx
   pop cx
   pop bx
   pop ax
endm
 
arrToVar macro value1, value2, value3
   push ax
   push bx
   push dx
   push cx
   mov bx, offset value2    ; Загружаем базовый адрес массива array в регистр bx
   mov ax, value3            ; Загружаем индекс в регистр ax
   shl ax, 1                     ; Умножаем индекс на 2 (размер каждого элемента массива)
   add bx, ax                    ; Добавляем смещение к базовому адресу массива
   mov ax, [bx]                  ; Загружаем значение X
   mov value1, ax               ; Присваиваем значение X переменной
   pop cx
   pop dx
   pop bx
   pop ax
   
endm
movUpper8 macro value1, value2
   push ax
   mov ah, value2
   mov value1, ah
   pop ax
endm  
 
movLower8 macro value1, value2
   push ax
   mov al, value2
   mov value1, al
   pop ax
endm
 
mov16 macro value1, value2
  push value2
  pop value1
endm  
 
mov32 macro value1, value2
   fild value2
   fistp value1
endm
 
sub_​macro value1, value2
​mov si, value2
​sub value1, si
endm
 
add_​macro value1, value2
​mov si, value2
​add value1, si
endm
 
cmp_​macro value1, value2
​mov si, value2
​cmp value1, si
endm
 
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
draw_alarm_arrow proc
   cmp alarm_active, 1
   jnz noview
   jmp view
noview:
   ret
view:
   mov ax, alarm_hour
   cmp ax, 12
   ja a33
   jmp a44
   a33:
   sub ax, 12
   a44:
   mov bx, 10
   mul bx  
 
   mov16 temp, alarm_min
   pushall
   mov ax, temp
   mov bx, 12
   div bx
   mov temp, ax    
   ; dec temp
   add_ temp, temp
   popall
   add ax, temp    
   mov index_alarm, ax
 
   movLower8 color, foo
   mov arrow.x0, 0
   mov arrow.y0, 0
   arrToVar arrow.x, array_sec, index_alarm
   inc index_alarm
   arrToVar arrow.y, array_sec, index_alarm
   dec index_alarm
   mov arrow.width, 1
   call draw_arrow
   ret
draw_alarm_arrow endp
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
 
   movLower8 color, black
   mov arrow.x0, 0
   mov arrow.y0, 0
   arrToVar arrow.x, array_sec, index_alarm
   inc index_alarm
   arrToVar arrow.y, array_sec, index_alarm
   dec index_alarm
   mov arrow.width, 3
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
 
draw_decimal proc​
​push ax
​push bx
​push cx
​push dx
​mov bx, 10    ; десятичная система счисления
​mov dx, 0     ; остаток от деления будет храниться здесь
​mov ax, value ; загружаем десятичное число
​mov cx, 0     ; счетчик цифр числа
​cmp ax, 0     ; проверяем, не равно ли число нулю
​jne skip_check
​mov dl, '0'   ; если число ноль, выводим единственный символ '0'
​mov ah, 02h   ; функция вывода символа с атрибутом
​int 21h
​jmp end_draw_decimal
   skip_check:
   process_digit:
​idiv bx        ; делим число на 10
​add dl, '0'   ; преобразуем остаток в символ
​push dx       ; сохраняем символ в стеке
​inc cx        ; увеличиваем счетчик цифр
​mov dx, 0     ; обнуляем остаток
​cmp ax, 0     ; проверяем, не равно ли частное нулю
​jne process_digit
   print_digits:
​pop dx        ; извлекаем цифру из стека
​mov ah, 02h   ; функция вывода символа с атрибутом
​int 21h
​loop print_digits
   end_draw_decimal:
​pop dx
​pop cx
​pop bx
​pop ax
   ret
draw_decimal endp
 
 
 
check_digit proc
   cmp al, 'a'
   jz left
   cmp al, 'd'
   jz right
   cmp al, 'w'
   jz up
   cmp al, 's'
   jz down
   ret
left:
   ;selected_digit = (selected_digit - 2 + total_digits) % total_digits + 1
   xor ax, ax
   mov al, selected_digit
   sub al, 2
   add al, total_digits
   div total_digits
   inc ah
   mov selected_digit, ah
   ret
right:
   ;selected_digit = (selected_digit % total_digits) + 1
   xor ax, ax
   mov al, selected_digit                                                                          
   div total_digits
   inc ah
   mov selected_digit, ah
   ret
up:
   mov alarm_active, 0
   movLower8 alarm_color, green
   xor ax, ax
   xor dx, dx
   mov bx, offset alarm_time
   mov al, selected_digit
   dec al
   shl ax, 1
   add bx, ax
   mov ax, [bx]
   inc ax
   cmp ax, 9
   ja  refresh_0
   jmp up_quit
refresh_0:
   mov ax, 0
up_quit:
   mov [bx], ax
 
   ret
down:
   mov alarm_active, 0
   movLower8 alarm_color, green
   xor ax, ax
   xor dx, dx
   mov bx, offset alarm_time
   mov al, selected_digit
   dec al
   shl ax, 1
   add bx, ax
   mov ax, [bx]
   dec ax
   js refresh_9
   jmp down_quit
refresh_9:
   mov ax, 9
down_quit:
   mov [bx], ax
   ret
check_digit endp
 
clear_keyboard_buffer proc
clear_buffer:
   mov ah, 01h    ; Функция проверки состояния клавиатуры
   int 16h
   jz buffer_empty ; Если буфер пуст, выходим из цикла
   mov ah, 00h    ; Функция чтения символа из буфера клавиатуры
   int 16h
   jmp clear_buffer ; Повторяем, пока буфер не станет пустым
 
buffer_empty:
   ret
clear_keyboard_buffer endp
 
draw_alarm proc
   mov bx, offset alarm_time    
   movLower8 cursorX, alarm_x
   movLower8 cursorY, alarm_y
   mov ax, [bx]
   mov value, ax
   call set_cursor
 
   movLower8 color, alarm_color      
   cmp selected_digit, 1
   jz selected_digit1
   jmp noselected_digit1
   selected_digit1:
   movLower8 color, white  
   noselected_digit1:
   call draw_digit
 
   mov bx, offset alarm_time
   add cursorX, 1
   mov ax, [bx + 2]
   mov value, ax
   call set_cursor
 
   movLower8 color, alarm_color  
   cmp selected_digit, 2
   jz selected_digit2
   jmp noselected_digit2
   selected_digit2:
   movLower8 color, white  
   noselected_digit2:
   call draw_digit
 
   mov bx, offset alarm_time
   add cursorX, 1
   call set_cursor
   mov bh, 0
   mov cx, 1
   mov al, ':'
   mov bl, white
   mov ah, 09h
   int 10h
 
   mov bx, offset alarm_time
   add cursorX, 1
 
   mov ax, [bx + 4]
   mov value, ax
   call set_cursor
 
   movLower8 color, alarm_color  
   cmp selected_digit, 3
   jz selected_digit3
   jmp noselected_digit3
   selected_digit3:
   movLower8 color, white  
   noselected_digit3:
   call draw_digit
 
   mov bx, offset alarm_time
   add cursorX, 1
   mov ax, [bx + 6]
   mov value, ax
   call set_cursor
 
   movLower8 color, alarm_color
   cmp selected_digit, 4
   jz selected_digit4
   jmp noselected_digit4
   selected_digit4:
   movLower8 color, white  
   noselected_digit4:
   call draw_digit
 
   ret
draw_alarm endp
 
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
beg:
   finit
 
   mov ax, @data
   mov ds, ax
   xor ax, ax
   
   mov ah, 4Fh     ; Видеорежим SVGA
   mov al, 02h​    ; Установить видео-режим.
   mov bx, 105h    ; Разрешение 1280x768, 256 цветов
   int 10h
   
   call draw_information
 
   movLower8 alarm_color, green
   call draw_alarm
 
   movLower8 color, green
   call draw_frame_alarm
   call draw_clock
   
timeloop:
   movLower8 color, white
   mov clock.x, 0
   mov clock.y, 3
   mov clock.r, 3
   call draw_circle
   
   xor ax, ax
   xor dx, dx
   xor bx, bx
   xor cx, cx
 
   xor ax, ax
 
   mov ah, 01h ; проверить буфер клавиатуры
   int 16h
   jz notpress
 
   mov ah, 00h ; получить символ из буфера клавиатуры
   int 16h
 
   cmp al, 1Bh     ; = ESC
   jz loopend
   cmp al, 0Dh     ; enter
   jz valid
   jmp novalid_alarm
valid:
   mov alarm_active, 1
   call valid_alarm
   ; alarm_hour
   ; alarm_min
   movLower8 alarm_color, foo
   mov selected_digit, 0
   movLower8 color, green
   call draw_frame_alarm
novalid_alarm:    
   call check_digit
   call draw_alarm
   call clear_keyboard_buffer  
 
   notpress:    
   cmp_ alarm_hour, current_hour
   jnz nextstep
   cmp_ alarm_min, current_min
   jnz nextstep
 
   cmp alarm_active, 1
   jnz nextstep
   ; сброс будильника
   mov alarm_active, 0
   movLower8 color, red
   call draw_frame_alarm
   
   nextstep:
   call update_time
   ;call check_alarm
 
jmp timeloop
   ; конец цикла
   loopend:
   call program_end
 
update_time proc
   mov ah, 02h
   int 1Ah    
   cmp old_sec, dh
   jnz new_time
   jmp old_time
   new_time:
   mov old_sec, dh
   call erase_arrows
   mov ah, 02h
   int 1Ah
   mov byte ptr sec, dh
   fbld sec
   fistp temp
   mov ax, temp
   mov bx, 2
   mul bx                  
   mov index_sec, ax
   ;для минутной
   mov ah, 02h
   int 1Ah
   mov byte ptr min, cl
   fbld min
   fistp temp
   mov16 current_min, temp
   push temp
   mov ax, temp
   mov bx, 2
   mul bx                  
   mov index_min, ax    
   ;для часовой
   mov ah, 02h
   int 1Ah
   mov byte ptr hour, ch
   fbld hour
   fistp temp
   mov16 current_hour, temp
   mov ax, temp
   cmp ax, 12
   ja a3
   jmp a4
   a3:
   sub ax, 12
   a4:
   mov bx, 10
   mul bx  
 
   pop temp
   pushall
   mov ax, temp
   mov bx, 12
   div bx
   mov temp, ax
   add_ temp, temp
   popall
   add ax, temp    
   mov index_hour, ax
   
   call draw_hour_arrow
   call draw_min_arrow
   call draw_sec_arrow
   call draw_alarm_arrow
 
   old_time:
   ret
update_time endp
valid_alarm proc
   mov bx, offset alarm_time
   mov ax, 10
   mov dx, [bx]
   mul dx
   mov dx, [bx+2]
   add ax, dx
   mov alarm_hour, ax
   cmp alarm_hour, 24
   jae correct_hour
   jmp valid_hour
correct_hour:
   mov alarm_hour, 23
   mov [bx], 2
   mov [bx+2], 3    
valid_hour:
   mov ax, 10
   mov dx, [bx+4]
   mul dx
   mov dx, [bx+6]
   add ax, dx
   mov alarm_min, ax
   cmp alarm_min, 60
   jae correct_min
   jmp valid_min
correct_min:
   mov alarm_min, 59
   mov [bx+4], 5
   mov [bx+6], 9    
valid_min:
   ret
valid_alarm endp
program_end proc
   mov cursorX, 1
   mov cursorY, 15
   call set_cursor
   ; завершение работы
   mov ah, 4Ch
   int 21h        ; Вызов прерывания DOS для завершения программы
   ret
program_end endp
 
draw_information proc
   mov cursorX, 3
   mov cursorY, 1
   call set_cursor
   mov dx, offset group
   mov ah, 09h
   int 21h
   mov cursorY, 2
   call set_cursor
   mov dx, offset valentin
   mov ah, 09h
   int 21h
   mov cursorY, 3
   call set_cursor
   mov dx, offset isa
   mov ah, 09h
   int 21h
   mov cursorY, 4
   call set_cursor
   mov dx, offset andrew
   mov ah, 09h
   int 21h
   mov cursorY, 5
   call set_cursor
   mov dx, offset vladimir
   mov ah, 09h
   int 21h
 
ret
draw_information endp
 
draw_frame_alarm proc
   mov arrow.width, 3
   mov arrow.x0, -490
   mov arrow.y0, 248
   mov arrow.x, -270
   mov arrow.y, 248
   call draw_arrow
 
   mov arrow.x0, -270
   mov arrow.y0, 248
   mov arrow.x, -270
   mov arrow.y, 190
   call draw_arrow
 
   mov arrow.x0, -490
   mov arrow.y0, 190
   mov arrow.x, -270
   mov arrow.y, 190
   call draw_arrow
 
   mov arrow.x0, -490
   mov arrow.y0, 248
   mov arrow.x, -490
   mov arrow.y, 190
   call draw_arrow
 
   mov cursorY, 8
   mov cursorX, 5
   call set_cursor
   mov dx, offset title_prog
   mov ah, 09h
   int 21h
ret
draw_frame_alarm endp
end beg