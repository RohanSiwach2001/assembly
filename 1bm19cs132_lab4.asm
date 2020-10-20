.model small
Display Macro MSG
  LEA DX,MSG
  MOV AH,09H
  INT 21H
 ENDM
.DATA
LIST DB 01H,05H,07H,10H,14H
NUMBER EQU ($-LIST)
KEY DB 021H
MSG1 DB 0DH,0AH , "ELEMENT FOUND IN THE LIST ....$"
MSG2 DB 0DH ,0AH , "ELEMENT NOT FOUND IN LIST ...$"
.CODE
START : MOV AX,@DATA
        MOV DS,AX
        MOV CH,NUMBER-1
        MOV CL,00H
AGAIN : MOV SI, OFFSET LIST
        XOR AX,AX
        CMP CL,CH
        JE NEXT
        JNC FAILED
NEXT:   MOV AL,CL
        ADD AL,CH
        SHR AL,01H
        MOV BL,AL
        XOR AH,AH
        MOV BP,AX
        MOV  AL,DS:[BP][SI]
        CMP Al,KEY
        JE SUCCESS
        JC INCLOW
        MOV CH,BL
        JMP AGAIN
INCLOW: MOV CL, BL
         INC CL
         JMP AGAIN
SUCCESS : DISPLAY MSG1
          JMP FINAL
FAILED : DISPLAY MSG2
FINAL :  MOV AH,4CH
         INT 21H
END START
