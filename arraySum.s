.data
array:  .word 15, 31, 2, 14, 9   # Initialize the array with the given values

    .text
    .globl main
main:
    la x5, array       # Load the base address of the array into x5
    li x6, 5           # Set x6 to 5 (the number of elements in the array)
    li x7, 0           # Initialize x7 to 0 (this will hold the sum)

sum_loop:
    lw x8, 0(x5)       # Load the current array element into x8
    add x7, x7, x8     # Add the current element to the sum
    addi x5, x5, 4     # Move to the next array element
    addi x6, x6, -1    # Decrement the loop counter
    bnez x6, sum_loop  # If the counter is not zero, continue looping

    # Now x7 holds the sum of the array elements
    # If you want to store this in another register, say x10, you can do:
    add x10, x0, x7    # Store the sum in x10