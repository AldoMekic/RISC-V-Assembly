.data
array:  .word 5, 7, 12, 3, 1    # Initialize the array

    .text
    .globl main
main:
    la x5, array        # Load the base address of the array into x5
    li x6, 5            # Set x6 to 5 (the length of the array)
    
    lw x7, 0(x5)        # Load the first element of the array into x7 (initial largest number)
    addi x8, x5, 4      # Set x8 to point to the second element of the array

loop:
    lw x9, 0(x8)        # Load the current element of the array into x9
    bge x7, x9, skip    # If the current largest number is greater or equal, skip to next
    addi x7, x9, 0      # Else, update the largest number to the current element

skip:
    addi x8, x8, 4      # Move to the next element in the array
    addi x6, x6, -1     # Decrement the loop counter
    bnez x6, loop       # If we haven't reached the end of the array, loop again

    # Now x7 holds the largest number
    # If you want to store this in another register, say x10, you can do:
    addi x10, x7, 0     # Store the largest number in x10