# newrap.m
##### Description
The newrap algorithm utilizes the newton-raphson method, an open roots finding method.  This method will quickly and efficiently converge on a root.  A positive to this method is that it only requires one guess at the root.  However, the user is not guarenteed convergence as there are multiple cases where this method diverges from a root entirely or converges to the wrong root.  Another disadvantage to this method is that one must know the function and its derivative to operate it.
###### Inputs
1. func = a function stored as a function handle
2. funcp = the function's derivative also stored as a function handle
3. xi = initial guess of the root
4. es = maximum absolute error allowed as a percent
5. maxiter = max number of iterations the algorithm will perform
###### Outputs
1. root = guess at the root
2. gx = function value at the guess
3. ea = approximate error of guess
4. iter = number of iterations performed
