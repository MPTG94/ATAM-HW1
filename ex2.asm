.global _start

.section .text
_start:
  #Write your code here
  # %rcx - stores the LCM 
    # %rax - stores the a value
    xor %rcx, %rcx
LOOP:
    addq  a, %rcx
    movq %rcx, %rax
    xor %rdx, %rdx
    divq b
    cmp $0, %rdx
    jne LOOP
    movq %rcx, c