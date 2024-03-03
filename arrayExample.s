addi x28, x0, 3  # Index for the first array
addi x29, x0, 1  # Index for the second array

slli x28, x28, 2  # Calculate the offset for the first array element (index * 4)
slli x29, x29, 2  # Calculate the offset for the second array element (index * 4)

add x3, x10, x28  # Address of the element in the first array
lw x30, 0(x3)     # Load the element from the first array (32-bit)

add x3, x11, x29  # Address of the element in the second array
sw x30, 0(x3)     # Store the element into the second array (32-bit)