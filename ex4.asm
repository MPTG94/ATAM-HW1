.global _start

.section .text
_start:
  #Write your code here
  # value already exists
    # value already exists
    # root is empty
    # traverse till leaf and add
    movq (root), %rbx
    cmpq $0, %rbx
    # root points to zero address, so we need to add new node as root value
    je ADD
    # getting the data value from new_node
    movq (new_node), %rax
LOOP:
    movq (%rbx), %rcx
    # comparing the data value of new_node to the data value of root
    cmpq %rcx, %rax
    # the value of the node is equal to new_root so no need to add
    je EXIT
    # the value of new node is less than the value of the current node, so need
    # to go left
    jl LEFT
    # the value of new node is greater than the value of the current node, so need
    # to go right    
    jmp RIGHT


LEFT:
    # backup the old memory address of the current node
    movq %rbx, %rdx
    movq 8(%rbx), %rbx
    cmpq $0, %rbx
    je ADDL
    jmp LOOP
    

RIGHT:
    # backup the old memory address of the current node
    movq %rbx, %rdx
    movq 16(%rbx), %rbx
    cmpq $0, %rbx
    je ADDR
    jmp LOOP

ADDL:
#    movq new_node, %rax
#    movq %rax, 8(%rdx)
    movq $new_node, 8(%rdx)
    jmp EXIT


ADDR:
#    movq new_node, %rax
#    movq %rax, 16(%rdx)
    movq $new_node, 16(%rdx)
    mov 16(%rdx), %r9
    jmp EXIT
    
ADD:    
#    movq new_node, %rax
#    movq %rax, (root)
    movq $new_node, (root)
    
EXIT: