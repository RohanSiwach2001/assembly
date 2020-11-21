model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm
.data
msg1 db 0dh,0ah,"Enter the Character$"
res db 02 dup(0)
.code
mov ax,@data
mov ds,ax
xor ax,ax
display msg1
mov ah,01h
int 21h
mov bl,al
mov cl,04h
shr al,cl
and al,0fh
cmp al,0ah
jc  digit
add al,07h
digit:add al,30h
mov res,al
and bl,0fh
cmp bl,0ah
jc digit1
add bl,07h
digit1:add bl,30h
mov res+1,bl

mov ah,00h
mov al,03h
int 10h

mov ah,02h
mov bh,00h
mov dl,28h
int 10h

mov res+2,byte ptr '$'
display res
mov ah,4ch
int 21h
end
