.global main

.section .text
main:
  # %ebx - loop counter
  # %edx - division remainder
  # %rax - num holder
  # %r9d - divisor
  # %ecx - countBits result
  #Write your code here
  xor %ebx, %ebx
#  movl $3, %edx
  movq num, %rax
  xor %ecx, %ecx
  movl $2, %r9d
LOOP:
  cmp $64, %ebx
  je END
  inc %ebx
  xor %edx, %edx
  div %r9
  cmpl $1, %edx
  # if %edx == 1 then we took of a '1' bit
  je INC
  # THIS SECTION IF CF IS 0
  jmp LOOP

INC:
  incl %ecx
  jmp LOOP

END:
  movl %ecx, countBits
  
 
  cmpl $0x202, (num)
  jne bad_exit
  cmpl $2, (countBits)
  jne bad_exit

  movq $60, %rax
  movq $0, %rdi
  syscall

bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
num: .quad 0x
countBits:  .zero 4
