Include Irvine32.inc
;.MODEL small
;.STACK 100h
.data
arr DWORD 10,11,12,13,14,15,16,17,18,19,20
arr2 DWORD 10 DUP(?)
msg BYTE "your array is: ", 0
.code
main PROC
	call PrintArray
	call CopyArray
	call PrintArray2
exit
main endp

	
PrintArray PROC
		mov edx,OFFSET msg
		call WriteString
		call CRLF
		mov ecx,10
		mov esi,OFFSET arr
	print_loop:
		mov eax,[esi]
		call WriteInt
		call CRLF
		add esi, TYPE arr
	loop print_loop
	ret
PrintArray ENDP

CopyArray PROC
	;push all values
	mov ecx,10
	mov esi,OFFSET arr
	push_loop:
	mov eax,[esi]
	push eax
	add esi,type arr
	loop push_loop

	mov ecx,10
	mov edi, OFFSET arr2
	pop_loop:
	pop eax
	mov[edi],eax
	add edi,type arr2
	loop pop_loop
ret
CopyArray endp

PrintArray2 PROC
		mov edx,OFFSET msg
		call WriteString
		call CRLF
		mov ecx,10
		mov esi,OFFSET arr2
	print_loop:
		mov eax,[esi]
		call WriteInt
		call CRLF
		add esi, TYPE arr
	loop print_loop
	ret
PrintArray2 ENDP
END MAIN


		

