.global _start

.section .text
_start:
  # write your code here
  # rax - stores the address of the current node
    # rbx - stores the address of the next node
    # rcx - stores the id of current
    # rdx - stores the id of next
    # r9 - temp store for id #1
    # r10 - temp store for value #1
    # r11 - temp store for id #2
    # r12 - temp store for value #2
    movq (head), %rax
    cmpq $0, %rax
    # empty list
    je EXIT

MAIN_LOOP:
    cmp $0, 8(%rax)
    # means this is the end of the outer loop (made it to the end of the linked list)
    # and it should now be ordered
    je EXIT
    # store the address of the next node in rbx
    movq 8(%rax), %rbx
    
    
    
CHECK_IDS:
    # store ids of current nodes and compare
    movl (%rax), %ecx
    movl (%rbx), %edx
    cmpl %ecx, %edx
    jl SWAP
    
ITERATOR_LOOP:
    movq 8(%rbx), %rbx
    cmp $0, %rbx
    je FORWARD_CURRENT
    jmp CHECK_IDS
    
    
FORWARD_CURRENT:
    movq 8(%rax), %rax
    jmp MAIN_LOOP
    
SWAP:
    movl %ecx, %r9d
    movl 4(%rax), %r10d
    movl %edx, %r11d
    movl 4(%rbx), %r12d
    movl %r11d, (%rax)
    movl %r12d, 4(%rax)
    movl %r9d, (%rbx)
    movl %r10d, 4(%rbx)
    jmp ITERATOR_LOOP
    
    
EXIT: