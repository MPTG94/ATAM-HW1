.text
.global main
main:
    # write your code here
    # %ebx - array iterator
    # %eax - sum of values
    # %eax - division result (avg)
    # %r8d - stores array iteration length (len-1)
    # %r9d - stores current array element
    movl $0, %ebx 
    movl $0, %eax
    movl len, %r8d
LOOP:
    cmp %ebx, %r8d
    je DIVIDE

    movl arr(,%rbx,4), %r9d
    addl %r9d, %eax
    inc %rbx
    jmp LOOP

DIVIDE:
    movl len, %r8d
    xor %edx, %edx
    div %r8d
    mov %rax, avg



  cmpl $8, (avg)
  jne bad_exit

  movq $60, %rax
  movq $0, %rdi
  syscall

bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
arr: .int 6,12,9,8
len: .short 4
avg: .zero 4
