include irvine32.inc
.data
intArr SWORD 0,0,0,150,120,35,-12,66,4,0
msg1 BYTE "non zero val found: ",0
.code
main PROC
mov ecx,LENGTHOF intArr
mov esi,OFFSET intArr
compare_loop:
	movsx eax,word ptr [esi]
	cmp eax,0
	jnz notFOUND
	add esi,TYPE intArr
loop compare_loop

notFOUND:
	mov edx,offset msg1
	call WriteString
 ;to get index address
	mov eax,esi
	sub eax,offset intArr
	shr eax,1 ;shift right
	call writeint
	call CRLF
	movsx eax,word ptr [esi]
	call writeint
exit
main ENDP
END MAIN


