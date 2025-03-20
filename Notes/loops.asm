;printing right angled 1
;LAB 6 - TASK 2a

include irvine32.inc
.data
    num BYTE "1", 0
    count DWORD 0
.code
main PROC
    mov ecx, 1                 ;outer loop (num of rows)
L1:
    mov ebx,ecx
    mov edx, OFFSET num
L2:
    call WriteString            ;print "1"
    
    dec ebx
    jnz L2

                ;repeat for current row

    call crlf 
    inc ecx
    cmp ecx, 5
    jne L1
    ;move to next row
    ;loop L1                     ;repeat outer loop    
    
    exit
main ENDP
END main

;OUTPUT
;1
;1 1
;1 1 1
;1 1 1 1
;1 1 1 1 1
