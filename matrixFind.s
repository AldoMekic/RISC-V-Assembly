 .data
array1: .word 1, 2, 3
array2: .word 4, 10, 6
array3: .word 7, 8, 9
array_bases: .word array1, array2, array3  # Array of base addresses for the arrays

    .text
    .globl main
main:
    la x20, array_bases   # Load the base address of the array of base addresses
    li x21, 3             # x21 is the counter for the outer loop (3 arrays)

    li x23, 0             # x23 will hold the largest number found overall

outer_loop:
    lw x22, 0(x20)       # Load the base address of the current array into x22
    li x5, 3             # Inner loop counter, each array has 3 elements
    lw x6, 0(x22)        # Load the first element of the current array into x6 (current largest)

inner_loop:
    lw x7, 0(x22)        # Load the current element into x7
    bge x6, x7, skip     # Compare current element with the largest found in this array
    mv x6, x7            # If current element is larger, update x6

skip:
    addi x22, x22, 4     # Move to the next element in the current array
    addi x5, x5, -1      # Decrement inner loop counter
    bnez x5, inner_loop  # If not done with all elements, continue inner loop

    # Compare the largest number from the current array with the overall largest
    bge x23, x6, next_array
    mv x23, x6           # Update overall largest number if necessary

next_array:
    addi x20, x20, 4     # Move to the next array base address
    addi x21, x21, -1    # Decrement outer loop counter
    bnez x21, outer_loop # If not done with all arrays, continue outer loop

    # x23 now contains the largest overall number
    # If you want to store this in another register, say x10, you can do:
    mv x10, x23          # Store the largest overall number in x10