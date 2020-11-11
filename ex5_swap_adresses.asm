.global _start

.section .text
_start:
  # write your code here
  # write your code here
    # r9 - stores the number of replacements made in this iteration
    xor %r9, %r9
    movq (head), %rax
    cmpq $0, %rax
    # empty list
    je EXIT

SORT_HEAD:
    jmp CHECK_SWAP_1
CONTINUE:
    xor %r9, %r9
    movq (head), %rax
    # saving head into r10
    movq $head, %r10
    jmp SORT_STEP

    
SORT_STEP:
    # rax - stores the address of the current node
    # rbx - stores the id of the current node
    # rcx - stores the address of the next node
    # rdx - stores the id of the next node
    # r10 - stores the previous node
    # store the id of the current node in rbx
    movl (%rax), %ebx
    # store the address of the next node in rcx
    movq 8(%rax), %rcx
    cmpq $0, %rcx    
    je SORT_HEAD
    # store the id of the next node in rdx
    movl (%rcx), %edx
    cmpq %rbx, %rdx
    jl SWAP
    # get the address of the next node (from current)
SORT_END:
    # saving previous into r10
    movq %rax, %r10
    movq 8(%rax), %rax
    jmp SORT_STEP
    

SWAP:
    inc %r9
    cmp $head, %r10
    je SWAP_HEAD
    # save next->next into r11
    movq 8(%rcx), %r11
    # save the address of next into previous
    movq %rcx, 8(%r10)
    # set the next of old next, as current
    movq %rax, 8(%rcx)
    # save the next of old current as next->next
    movq %r11, 8(%rax)
    # make rax point to current again
    movq %rcx, %rax
    jmp SORT_END
    
SWAP_HEAD:
    # save next->next into r11
    movq 8(%rcx), %r11
    # save the address of next into previous
    movq %rcx, (%r10)
    # set the next of old next, as current
    movq %rax, 8(%rcx)
    # save the next of old current as next->next
    movq %r11, 8(%rax)
    # make rax point to current again
    movq %rcx, %rax
    jmp SORT_END
    
CHECK_SWAP_1:
    cmp $0, %r9
    je CHECK_SWAP_2
    jmp CONTINUE
    
CHECK_SWAP_2:
    cmpq $0, %rcx
    je EXIT
    jmp CONTINUE
    
EXIT:
  xor %rbx, %rbx
  xor %rax, %rax