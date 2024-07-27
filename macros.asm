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

sub_	macro value1, value2
	mov si, value2
	sub value1, si
endm

add_	macro value1, value2
	mov si, value2
	add value1, si
endm

cmp_	macro value1, value2
	mov si, value2
	cmp value1, si
endm
