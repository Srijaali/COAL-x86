include irvine32.inc

.data
n DWORD 4 DUP (?)
msg1 BYTE "Enter number: ",0
msg2 BYTE "Number equal",0
msg3 BYTE "Number not equal",0

.code
main PROC
    ; Input 4 numbers
    mov ecx, LENGTHOF n
    mov esi, OFFSET n
input:
    mov edx, offset msg1
    call WriteString
    call ReadInt
    mov [esi], eax
    add esi, TYPE n
loop input

    ; Nested loop to compare all pairs
    mov ecx, LENGTHOF n
    mov esi, OFFSET n
outer_loop:
    push ecx              ; save outer loop counter
    mov edi, esi
    add edi, TYPE n       ; compare with next value

    mov ecx, OFFSET n + (4 * TYPE n) ; end of array
    sub ecx, edi          ; how many bytes left
    shr ecx, 2            ; convert bytes to DWORD count
inner_loop:
    cmp ecx, 0
    je continue_outer
    mov eax, [esi]        ; current outer value
    mov ebx, [edi]        ; current inner value
    cmp eax, ebx
    je numbers_equal
    add edi, TYPE n
    dec ecx
    jmp inner_loop

continue_outer:
    pop ecx
    add esi, TYPE n
    loop outer_loop

    ; No matches found
    mov edx, offset msg3
    call WriteString
    jmp end_program

numbers_equal:
    pop ecx               ; clean stack if jumped from inner loop
    mov edx, offset msg2
    call WriteString
    call WriteInt         ; optional: print matching value
end_program:
    call ExitProcess
main ENDP
END main
