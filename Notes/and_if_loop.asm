include irvine32.inc
.data
intArr SWORD 0,0,0,150,120,35,-12,66,4,0
var DWORD 5
x DWORD ?
.code
main PROC
mov ecx,LENGTHOF intArr
mov edx,var
add edx,1
check_loop:
cmp var,ecx
jl check_loop2
mov x,1
mov eax,x
call writeint
jmp end_prog
	check_loop2:
	cmp ecx,edx
	jge x_count
	x_count:
	mov x,0
	mov eax,x
	call writeint
end_prog:
exit
main ENDP
END MAIN


