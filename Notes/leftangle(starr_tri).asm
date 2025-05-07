INCLUDE Irvine32.inc

.data
cols DWORD 5         ; number of columns (you can change this)
newline BYTE 0Dh,0Ah,0

.code
main PROC
    mov eax, cols     ; pass column count in EAX
    call PrintPattern
    exit
main ENDP

; --------------------------
; PrintPattern:
; prints a triangle of stars with the number of columns in EAX
; --------------------------
PrintPattern PROC
    push eax           ; save number of columns
    mov ecx, eax       ; outer loop count

    mov ebx, 1         ; line counter (from 1 to EAX)
outer_loop:
    mov edx, ebx       ; edx = number of stars to print on this line
inner_loop:
    mov al, '*'        ; character to print
    call WriteChar
    dec edx
    jnz inner_loop

    call Crlf          ; move to next line
    inc ebx
    loop outer_loop

    pop eax
    ret
PrintPattern ENDP

END main
