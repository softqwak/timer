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

    mov ah, 4Fh     ; �����०�� SVGA
    mov al, 02h	    ; ��⠭����� �����-०��.
    mov bx, 105h    ; ����襭�� 640x480, 256 梥⮢
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
    ; �⥭�� ᨬ���� �� ���� ���������� ��� ����
    mov ah, 01h
    int 16h
    ; �᫨ � ���� ��� ᨬ����, � 䫠� zf = 1
    jz notpress
    ; �ࠢ����� ᨬ���� �� ����
    cmp al, 1Bh
    jz loopend_bridge
    jmp loop_continue
    loopend_bridge:
    jmp loopend
    loop_continue:

    ; ������ ����� �㤨�쭨��
    ; ��砫쭮� �६� �㤨�쭨�� 27:50
    ; ��५�窠�� <- -> �롨ࠥ� ����
    ; ��५�窨 ����� ���� �����塞 ���祭�� ����
    ; �� ����⨨ ������ enter(13) �஢�ઠ ���祭�� �ᮢ � �����
    ; �᫨ �� �ࠢ��쭮 �㤨�쭨� ��⠭�����
    ; �᫨ ���祭�� ���ࠢ���� � ��� (23 �᫨ >23) � ������ (59 �᫨ >59) 

    ; ��⨬ ����, ��� ᫥���饩 ���樨
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

    ;��� ����⭮�
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
    
    ;��� �ᮢ��
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
    ; ����� 横��
    loopend:

    ; �����襭�� ࠡ���
    mov ah, 4Ch 
    int 21h        ; �맮� ���뢠��� DOS ��� �����襭�� �ணࠬ��







end beg
