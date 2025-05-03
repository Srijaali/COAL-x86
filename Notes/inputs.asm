INCLUDE Irvine32.inc

.data
    employee DWORD 5 DUP(?)
    name byte 5 DUP(20DUP(?))
    id DWORD 5 DUP (?)
    bday DWORD 5 DUP (?)
    salary DWORD 5 DUP(?)

    str1 db "enter name: ",0
    str2 db "enter id: ",0
    str3 db "enter dob: ",0
    str4 db "enter salary: ",0
    str5 db "all salaray: ",0
.code
main proc
    mov ecx,5
    mov esi,offset employee;points to first array emmployee
    mov edi,0

  input:
    mov edx,offset str1
    call WriteString
    mov edx,offset name
    add edx,edi
    call ReadString


    mov edx,offset str2
    call WriteString
    mov edx,offset id
    add edx,esi
    call ReadInt
    mov [edx],eax

    mov edx,offset str3
    call WriteString
    mov edx,offset bday
    add edx,esi
    call ReadInt
    mov [edx],eax

    mov edx,offset str4
    call WriteString
    mov edx,offset salary
    add edx,esi
    call ReadInt
    mov [edx],eax

    add edi,20
    add esi,4
  loop input

  mov ecx,5
  mov eax,0
  mov esi,offset salary
  
  summsal:
  add eax,[esi]
  add esi,TYPE salary
  loop summsal
 call WriteInt

   exit
main ENDP
END main
