.model small
.stack 100h
.data
include src.asm

.code
include macros.asm
include procs.asm
beg:
    finit

    mov ax, @data
    mov ds, ax
    xor ax, ax 

    mov ah, 4Fh     ; Видеорежим SVGA
    mov al, 02h	    ; Установить видео-режим.
    mov bx, 105h    ; Разрешение 640x480, 256 цветов
    int 10h

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
    ; чтение символа из буфера клавиатуры без паузы
    mov ah, 01h
    int 16h
    ; если в буфере нет символа, то флаг zf = 1
    jz notpress
    ; сравнение символа из буфера
    cmp al, 1Bh
    jz loopend_bridge
    jmp loop_continue
    loopend_bridge:
    jmp loopend
    loop_continue:

    ; Алгоритм ввода будильника
    ; начальное время будильника 27:50
    ; стрелочками <- -> выбираем цифру
    ; стрелочки вверх вниз изменяем значение цифры
    ; при нажатии клавиши enter(13) проверка значений часов и минут
    ; если все правильно будильник установлен
    ; если значения неправильные то часы (23 если >23) и минуты (59 если >59) 

    ; чистим буфер, для следующей итерации
    mov ah, 0h
    int 16h
    notpress:
    
    mov ah, 02h
    int 1Ah    

    cmp old_sec, dh
    jz timeloop
    
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
    
    ; dec temp
    add_ temp, temp
    popall
    add ax, temp
    
    mov index_hour, ax
    
    call draw_hour_arrow
    call draw_min_arrow
    call draw_sec_arrow

   
jmp timeloop 
    ; конец цикла
    loopend:

    ; завершение работы
    mov ah, 4Ch 
    int 21h        ; Вызов прерывания DOS для завершения программы







end beg
