function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter,varargin)
%falsePosition locates zeroes in user defined function
%   By Michael Irlbeck on 2/28/2019.
%   [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter,varagin)
%       Navigates toward a root within user specified brackets using the
%       false position method.
% input:
%   func = user specified function.  ensure to specify @ with function
%   variable in ()
%   xl, xu = lower and upper bounds around root
%   es = minimum error between root estimates
%   maxiter = max number of iterations using this function
% output:
%   root = esimated value at root
%   fx = function value at the root
%   ea = approximate error between guesses (%)
%   iter = number of iterations performed
if nargin < 3
    error('Must input at least three values')
end
if nargin < 4
    es = 0.0001; %default error estimate to 0.001%
end
if nargin < 5
    maxiter = 200; %default maximum number of iterations to 50
end
if sign(func(xl)) == sign(func(xu)) %test if a root exists inbetween brackets
    error('No sign change on interval')
end
%Calculations
iter = 0; ea = 100; xr = xu; %created variables to work with
while iter < maxiter && ea > es
    xrold = xr; %temporarily save old xr for error calculation
    iter = iter + 1; %to keep track of number of iterations
    xr = xu - (func(xu)*(xu-xl))/(func(xu)-func(xl));
    %replacing xr with endpoint with same sign
    if sign(func(xr)) == sign(func(xl))
        xl = xr;
    elseif sign(func(xr)) == sign(func(xu))
        xu = xr;

    end
    ea = abs((xr-xrold)/xr*100); %calculation of approx error
end 
root = xr; 
fx = func(xr,varargin{:});
