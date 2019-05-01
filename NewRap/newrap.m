function [root,gx,ea,iter] = newrap(func,funcp,xi,es,maxiter,varargin)
%newrap Determines root of function using Newton-Raphson method
%   [root,gx,ea,iter] = newrap(gx,g'x,es,maxiter,varargin)
%       finds the root using the equation xnew = xold - f(xold)/f(xold) and
%       repeats method until the error approximation or max number of
%       iterations are exceeded.
%--------------------------------------------------------------------------
% Created by: Michael Irlbeck on 3/10/2019
% Modified:
%--------------------------------------------------------------------------
%Input:
%   func = function
%   funcp = derivative of function
%   xi = initial guess
%   es = max absolute approximate error allowed (%)
%   maxiter = max number of iterations function will perform
%Ouput:
%   root = guess at root
%   gx = function value at root
%   ea = approximate error 
%   iter = number of iterations performed
%% Error Check
if nargin < 3
    error('Need to input at least three arguments')
end
if nargin < 4
    es = 0.0001;
end
if nargin < 5
    maxiter = 25;
end
if nargin > 5
    error('Too many inputs. Only input a max of 5 arguments')
end
%% Assign Initial Values
xold = xi; iter = 0; ea = 100; xnew = 0;
%% Calculations
while es <= ea && iter < maxiter
    iter = iter + 1;
    xnew = xold - func(xold)/funcp(xold);
    ea = (xnew - xold)/xnew * 100;
end
%% End Values
root = xnew; gx = func(xnew,varargin{:});
end

