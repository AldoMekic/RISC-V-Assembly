.data
A:  .word 1, 2, 3, 4, 5     # Define array A with the specified values
B:  .word 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1  # Define array B with the specified values

    .text
    .globl main
main:
    # Initialize i and j
    addi x5, x0, 3        # i = 3
    addi x6, x0, 4        # j = 4

    # Load base addresses of arrays A and B
    la x10, A             # Load the base address of A into x10
    la x11, B             # Load the base address of B into x11

    # Calculate the address of A[i] and load its value
    slli x7, x5, 2        # x7 = i * 4 (byte offset for i)
    add x7, x10, x7       # x7 = address of A[i]
    lw x8, 0(x7)          # Load A[i] into x8

    # Calculate the address of A[j] and load its value
    slli x9, x6, 2        # x9 = j * 4 (byte offset for j)
    add x9, x10, x9       # x9 = address of A[j]
    lw x9, 0(x9)          # Load A[j] into x9

    # Add A[i] and A[j], store in x8
    add x8, x8, x9        # x8 = A[i] + A[j]

    # Calculate the address of B[10] and store the result there
    li x7, 40             # x7 = 10 * 4 (byte offset for B[10])
    add x7, x11, x7       # x7 = address of B[10]
    sw x8, 0(x7)          # Store the result in B[10]