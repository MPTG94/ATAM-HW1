.text
.global main
main:
    # write your code here
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
    movq $new_node, 8(%rdx)
    jmp EXIT


ADDR:
    movq $new_node, 16(%rdx)
    mov 16(%rdx), %r9
    jmp EXIT
    
ADD:    
    movq $new_node, (root)
    
EXIT:
    

  cmpq $A, (root)
  jne bad_exit

  movq $A, %rbx
  cmpq $20, (%rbx)
  jne bad_exit
  cmpq $B, 8(%rbx)
  jne bad_exit
  cmpq $C, 16(%rbx)
  jne bad_exit

  movq $B, %rbx
  cmpq $-4, (%rbx)
  jne bad_exit
  cmpq $0, 8(%rbx)
  jne bad_exit
  cmpq $D, 16(%rbx)
  jne bad_exit

  movq $C, %rbx
  cmpq $26, (%rbx)
  jne bad_exit
  cmpq $new_node, 8(%rbx)
  jne bad_exit
  cmpq $0, 16(%rbx)
  jne bad_exit

  movq $D, %rbx
  cmpq $-3, (%rbx)
  jne bad_exit
  cmpq $0, 8(%rbx)
  jne bad_exit
  cmpq $0, 16(%rbx)
  jne bad_exit

  movq $new_node, %rbx
  cmpq $25, (%rbx)
  jne bad_exit
  cmpq $0, 8(%rbx)
  jne bad_exit
  cmpq $0, 16(%rbx)
  jne bad_exit

  movq $60, %rax
  movq $0, %rdi
  syscall

bad_exit:
  movq $60, %rax
  movq $1, %rdi
  syscall

.section .data
root:
        .quad   A
A:
        .quad   20
        .quad   B
        .quad   C
B:
        .quad   -4
        .quad   0
        .quad   D
C:
        .quad   26
        .quad   0
        .quad   0
D:
        .quad   -3
        .quad   0
        .quad   0

new_node:
        .quad   25
        .quad   0
        .quad   0
