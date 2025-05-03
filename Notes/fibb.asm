INCLUDE Irvine32.inc

.data
n1 DWORD 0        ; First number in Fibonacci
n2 DWORD 1        ; Second number

.code
main PROC
    ; Print the first number (0)
    mov eax, n1
    call WriteInt
    call Crlf

    ; Print the second number (1)
    mov eax, n2
    call WriteInt
    call Crlf

    ; Now print next 8 Fibonacci numbers (total 10 numbers)
    mov ecx, 8          ; Loop counter for next 8 numbers

L1:
    ; Calculate sum = n1 + n2
    mov eax, n1
    add eax, n2         ; eax = n1 + n2

    ; Save result in a safe register (e.g., edi)
    mov edi, eax        ; edi = next Fibonacci number

    ; Print the Fibonacci number
    mov eax, edi
    call WriteInt
    call Crlf

    ; Update n1 and n2 for next round
    mov eax, n2
    mov n1, eax         ; n1 = previous n2

    mov eax, edi
    mov n2, eax         ; n2 = new Fibonacci number

    loop L1

    exit
main ENDP
END main
