# LU_decomp.m
##### Description
This algorithm implements a matrix process known as LU decomposition.  This process involves breaking down a matrix into an upper triangular matrix, a lower triangular matrix, and a pivot matrix through forward elimination. Next, it back substitutes to solve for the solutions to the system of equations.
###### Inputs
1. A = a square coefficient matrix
2. b = a column matrix
###### Outputs
1. x = a column matrix of solutions
2. L = lower triangular matrix 
3. U = upper triangular matrix
4. P = identity matrix to keep track of pivoting
