.data
array1: .word 3, 10, 21, 5
array2: .word 1, 2, 3, 4
array3: .word 9, 7, 17, 27
array4: .word 6, 13, 2, -1
array_bases: .word array1, array2, array3, array4  # Array of base addresses for the arrays

    .text
    .globl main
main:
    la x20, array_bases   # Load the base address of the array of base addresses
    li x21, 4             # x21 is the counter for the outer loop (4 arrays)

    li x24, 0             # x24 will hold the overall sum of all arrays

outer_loop:
    lw x22, 0(x20)       # Load the base address of the current array into x22
    li x5, 4             # Inner loop counter, each array has 4 elements
    li x23, 0            # x23 will hold the sum of the current array

inner_loop:
    lw x6, 0(x22)        # Load the current element of the array into x6
    add x23, x23, x6     # Add the current element to the current array's sum
    addi x22, x22, 4     # Move to the next element in the current array
    addi x5, x5, -1      # Decrement the inner loop counter
    bnez x5, inner_loop  # If not done with all elements, continue inner loop

    # Add the current array's sum to the overall sum
    add x24, x24, x23

    addi x20, x20, 4     # Move to the next array base address
    addi x21, x21, -1    # Decrement outer loop counter
    bnez x21, outer_loop # If not done with all arrays, continue outer loop

    # x24 now contains the overall sum of all array elements
    # If you want to store this in another register, say x10, you can do:
    mv x10, x24          # Store the overall sum in x10