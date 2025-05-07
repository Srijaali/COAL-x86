include irvine32.inc
.data
msg1 BYTE "Enter the number you want to add: ",0
n DWORD ?
.code
main PROC
mov edx,offset msg1
call WriteString
call Readint
mov n,eax
call add1
exit
main ENDP

add1 PROC
mov ecx,n
mov eax,0
L1:
add eax,ecx
loop l1
call WriteInt
ret 
add1 ENDP
END MAIN


