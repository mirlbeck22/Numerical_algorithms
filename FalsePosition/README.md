# FalsePosition.m
##### Description
This algorithm relies on the false position method to locate a root of a function.  This is a closed roots finding method where the initial guesses must bracket the root.  Additionally, this algorithm will always locate the root and is generally more efficient than the biesction method.  However, this method is prone to one sidedness of a function, one side of the interval's derivative is drastically different in magnitude from another, which will decrease efficiency.
###### Input
1. func = function saved as a function handle
2. xl = lower bound on root
3. xu = upper bound on root
4. es = minimum absolute relative error of root as a percent
5. maxiter = maximum number of iterations algorithm will perform
###### Ouput
1. root = estimated value of root
2. fx = function value at the root
3. ea = approximate error between guesses as a percent
4. iter = number of iterations performed
