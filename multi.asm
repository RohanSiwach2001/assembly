model small
.data
num1 db 3
num2 db 2
res  dB ?
.code
MOV AX,@DATA
MOV DX ,AX
MOV AL, NUM1

MUL NUM2
MOV RES , AL
MOV AH,4CH
INT  21H
END
