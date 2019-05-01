function [x,L,U,P] = lu_decomp(A,b,varargin)
%lu_decomp Solves a system of equations using LU decomposition.
%   Breaks coefficient A matrix into matrices L and U using forward
%   elimination and then back sustitutes through the L matrix and b matrix 
%   to solve for d.  Lastly, it solves for x using U and d.
% Inputs
%   A = a square coefficient matrix
%   b = a column matrix 
% Outputs
%   x = column matrix of answers
%   L = lower triangular matrix created from forward substitution
%   U = upper triangular matrix created from forward substitution
%   P = identity matrix to keep track of pivoting
%--------------------------------------------------------------------------
% Created by: Michael Irlbeck on 3/30/2019. NOT COMPLETE
% List of Modification dates:
%--------------------------------------------------------------------------
% Check for input errors
if nargin < 2
    error('Function needs two inputs.')
end
if nargin > 2
    error('Max of two inputs.')
end
[m,n] = size(A);
if n ~= m
    error('The input matrix must be square (nxn).')
end
%% Forward elimination to find L and U
U = A;
P = eye(n);
L = P;
for c = 1:n-1 %cycling through columns in A
    %create pivot matrices
    Utemp = U;
    Ltemp = L;
    Ptemp = eye(n);
    %check to pivot and then pivot both U and b
    for p = 1:n-c
        if abs(Utemp(p+c,c)) > abs(Utemp(c,c))
            Ptemp = eye(n);
            Ltemp = L;
            Ptemp([p+c,c],:) = Ptemp([c,p+c],:); %switching rows
            Utemp = Ptemp*Utemp;
            if c > 1
                Ltemp([p+c,c],1:c-1) = Ltemp([c,p+c],1:c-1);
            end
        end
    end
    U = Ptemp*U;  %pivoting matrices
    L = Ltemp; 
    P = Ptemp*P;
    %elimination
    for r = c+1:n %cycling through rows in A
        norm = U(r,c)/U(c,c); %calculates normalization element
        U(r,c:n) = U(r,c:n) - norm*U(c,c:n); %elimination
        L(r,c) = norm; %creating L matrix
    end
end
%% Solving for d with L*d = b
d = zeros(n,1);
d(1) = b(1); %calculates first variable
for r = 2:n %starts from second row and solves downward
    d(r) = (b(r) - L(r,1:r-1)*d(1:r-1,:));
end 
%% Solving for x using U*x = d
x = zeros(n,1); %final x column matrix
x(n) = d(n)/U(n,n); %calculates first variable
for r = n -1 : -1 : 1 %works with solving lowest row U and works up (hence the negative one)
    x(r) = (d(r) - U(r,r+1:n)*d(r+1))/U(r,r);
end
end
