.text
.global main
main:
    # write your code here
    # %rcx - stores the LCM 
    # %rax - stores the a value
    # %rdx - stores the modulo result
    xor %rcx, %rcx
LOOP:
    addq  a, %rcx
    movq %rcx, %rax
    xor %rdx, %rdx
    divq b
    cmp $0, %rdx
    jne LOOP
    movq %rcx, c

  cmpl $12, (c)
  jne bad_exit

  movq $60, %rax
  movq $0, %rdi
  syscall

bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
a: .quad 0x6
b: .quad 0x4
c: .zero 8
