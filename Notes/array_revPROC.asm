PrintArrayReverse PROC
    mov edx, OFFSET str
    call WriteString

    mov ecx, 11                    ; number of elements
    mov esi, OFFSET arr
    add esi, (11 - 1) * TYPE arr   ; move pointer to last element

rev_loop:
    mov eax, [esi]
    call WriteInt
    sub esi, TYPE arr              ; move backwards
    loop rev_loop

    ret
PrintArrayReverse ENDP
