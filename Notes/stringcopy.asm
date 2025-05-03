INCLUDE Irvine32.inc

.data
  source BYTE "this is a string",0
  target BYTE SIZEOF source DUP(?)
.code
main proc
	mov esi,0
	mov ecx,SIZEOF source
	mov edx,offset source
	call WriteString
	call crlf
	L1:
	mov al,source[esi]
	mov target[esi],al
	inc esi
	cmp al,0
	jne L1

	mov edx,offset target
	call WriteString
   exit
main ENDP
END main
