INCLUDE Irvine32.inc

.DATA
  val1 DWORD 2
  val2 DWORD 3
  val3 DWORD 4   

.CODE
main PROC
    call Clrscr

    ; Push values in order: 2, 3, 4 → top of stack will be 4
    mov eax, val1
    push eax            ; stack: [2]

    mov eax, val2
    push eax            ; stack: [3, 2]

    mov eax, val3
    push eax            ; stack: [4, 3, 2]

    ; Pop and print each value
    pop eax             ; eax = 4
    call WriteInt       ; should print 4
    call CrLf

    pop ebx             ; ebx = 3
    call WriteInt       ; should print 3
    call CrLf

    add eax, ebx        ; eax = 4 + 3 = 7

    pop ecx             ; ecx = 2
    call WriteInt       ; should print 2
    call CrLf

    add eax, ecx        ; eax = 7 + 2 = 9

    call WriteInt       ; print 9
    call CrLf

    exit
main ENDP
END main
