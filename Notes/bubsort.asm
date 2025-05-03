INCLUDE Irvine32.inc

.data
  array DWORD 8,5,1,2,6
.code
main proc

mov ecx,LENGTHOF array
dec ecx
L1:
	push ecx
	mov esi,offset array
	mov ecx,LENGTHOF array
	dec ecx
	L2:
		mov eax,[esi]
		mov ebx,[esi+4]
		cmp eax,ebx
		jle noswap
		mov [esi],ebx
		mov[esi+4],eax
	noswap:
		add esi,4
		loop L2
		pop ecx
		loop L1

	mov ecx, LENGTHOF array
	mov esi,offset array
printl:
	mov eax,[esi]
	call WriteInt
	add esi,TYPE array
	loop printl

   exit
main ENDP
END main
