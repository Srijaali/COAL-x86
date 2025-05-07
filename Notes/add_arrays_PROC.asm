include irvine32.inc
.data
arr1 DWORD 1,2,3,4,5
arr2 DWORD 1,2,3,4,5
sum DWORD 0
sum2 DWORD 0
msg1 BYTE "sum1 array1: ",0
msg2 BYTE "sum2 array2: ",0
msg3 BYTE "total: ",0
.code 
main PROC
call ADD1
call ADD2
call ADD3
exit 
main endp

ADD1 PROC
mov ecx,5
mov esi,OFFSET arr1
mov eax,0
L1:
add eax,[esi]
add esi,type arr1
loop L1
mov edx,OFFSET msg1
call WriteString
call WriteInt
call CRLF
mov sum,eax
ret
ADD1 ENDP

ADD2 PROC
mov ecx,5
mov esi,OFFSET arr2
mov eax,0
L2:
add eax,[esi]
add esi,type arr2
loop L2
mov edx,OFFSET msg2
call WriteString
call WriteInt
call CRLF
mov sum2,eax
ret
ADD2 ENDP

ADD3 PROC
mov eax,sum
add eax,sum2
mov edx,OFFSET msg3
call WriteString
call WriteInt
call CRLF
ret
ADD3 ENDP

END MAIN



