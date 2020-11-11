.text
.global main
main:
    # write your code here
    xor %rcx, %rcx
    xor %rax, %rax
    xor %r8, %r8
    xor %r10, %r10
    
    xor %esi, %esi
    lea array, %rbx
    movb 3(%rbx), %al
    inc %esi
    mov 3(%rbx, %rsi, 8), %ecx
    # attempts to access 2 memory addresses in a single instruction
    #movw (%rbx, %rsi, 2), stam 
    xor %eax, %eax
    dec %eax
    mov %rax, %r9
    addq %rax, 2(%rbx, %rsi, 4)
    lea 4(%rbx, %rsi, 4), %r9
    movb 4(%rbx, %rsi, 4), %r8b
    mov $b, %rdi
    # attempts to write mismatching sizes (writing full 64 bit, but a is only 4 bytes(32 bits))
    #mov $2, a
    movq $array, a
    movq $array, %r10
    movswq (b), %rdx
    cdq
    movl $2, a
    idivl a
    # illegal register size maching for instruction
    #mulb %edx
    movq $1, (a)
    imul $2, a, %rdx
    xor %rax, %rax
    mov $0xff, %ax
    mov $2, %bx
    mov $1, %dx
    imulb %bl
    xor %r9, %r9
.section .data 
array: .long 0xf415, 0xf3561768, 0x8200f645
a: .short 1
b: .quad 0x670081b521c

.section .bss
.lcomm stam, 4
