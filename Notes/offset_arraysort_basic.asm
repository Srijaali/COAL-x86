; OFFSET operator returns the offset,memory address of a data label
; PTR operator to override the declared size of an operand
; TYPE returns the size, in bytes of a single element of variable
; LENGTHOF countts the no. of individual elements in a variable that has beeen defined using dup
; SIZEOF returns the no. of bytes an array takes up
; Indexed Operands:An indexed operand adds a constant to a register to generate an effective address.

INCLUDE irvine32.inc
.data
		arrayB BYTE 61,43,11,52,25
		array BYTE 5 DUP(?)
.code
main PROC
	mov array[0],11
	mov array[1],25
	mov array[2],43
	mov array[3],52
	mov array[4],61

	movzx eax,array[0]
	call writedec
	call crlf

	movzx eax,array[1]
	call writedec
	call crlf

	movzx eax,array[2]
	call writedec
	call crlf

	movzx eax,array[3]
	call writedec
	call crlf
	movzx eax,array[4]
	call writedec
	call crlf
	call dumpregs
	exit
main endp
end main

;lab5 q5:
INCLUDE irvine32.inc
.data
	array1 BYTE 10,20,30,40
	array2 BYTE 4 DUP(?)
.code
main PROC
	mov esi,OFFSET array1
	mov edi,OFFSET array2 + 3
	
	mov al , [esi] ;to getvalue put []
	mov [edi],al
	dec edi
	inc esi

	mov al,[esi]
	mov [edi],al
	dec edi
	inc esi

	mov al,[esi]
	mov [edi],al
	dec edi
	inc esi

	mov al,[esi]
	mov [edi],al

	mov esi,OFFSET array2
	mov ecx,4
print_loop:
	mov al,[esi]
	call writedec
	inc esi
	loop print_loop

	call crlf
	call dumpregs
	exit

main endp
end main
	
