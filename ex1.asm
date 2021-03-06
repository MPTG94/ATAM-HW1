.global _start

.section .text
_start:
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