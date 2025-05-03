INCLUDE Irvine32.inc

.data
  array BYTE 1,2,3,4,5
.code
main proc
	mov ecx,SIZEOF array/2
	mov esi,0
	mov edi,4
	
	rev:
	mov al,array[esi]
	mov bl,array[edi]
	mov array[esi],bl
	mov array[edi],al
	inc esi
	dec edi
	loop rev

	mov ecx, LENGTHOF array
	mov esi,offset array
	prinnt:
	movzx eax,byte ptr[esi]
	call WriteInt
	inc esi
	call crlf
	loop prinnt
	call CRLF

   exit
main ENDP
END main
