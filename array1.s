   .data               # Data segment
A:  .word 1, 5, 3, 10, 12  # Define array A with the specified values
B:  .word 21, 7, 15, 3, 0  # Define array B with the specified values

    .text               # Code segment
    .globl main
main:
    # Initial setup for the values of f and g
    addi x5, x0, 2   # Initialize f = 2
    addi x6, x0, 3   # Initialize g = 3

    la x10, A        # Load the base address of array A into x10
    la x11, B        # Load the base address of array B into x11

    # Operation starts here
    slli x30, x5, 2  # x30 = f*4 (calculate offset for A[f])
    add x30, x10, x30 # x30 = &A[f] (get address of A[f])

    slli x31, x6, 2  # x31 = g*4 (calculate offset for B[g])
    add x31, x11, x31 # x31 = &B[g] (get address of B[g])

    lw x5, 0(x30)    # Load A[f] into x5
    addi x12, x30, 4 # x12 = &A[f]+4 (address of A[f+1])
    lw x30, 0(x12)   # Load A[f+1] into x30

    add x30, x30, x5 # Add A[f] and A[f+1], result in x30

    sw x30, 0(x31)   # Store the result in B[g]