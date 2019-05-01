function [root,gx,ea,iter] = golden(func,xl,xu,es,maxiter,varargin)
%godlen Determines the maximum of a function using the golden method.
%   [root,gx,ea,iter] = golden(func,xl,xu,es,maxiter,varargin)
%       finds the maximum using the golden method and
%       repeats method until the error approximation or max number of
%       iterations are exceeded.
%--------------------------------------------------------------------------
% Created by: Michael Irlbeck on 3/10/2019
% Modified:
%--------------------------------------------------------------------------
%Input:
%   func = function
%   xl = lower bracket
%   xu = upper bracket
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
xopt = xu; iter = 0; ea = 100; phi = (1+sqrt(5))/2;
d = (phi-1)*(xu - xl); x1 = xl + d; x2 = xu - d;
f1 = func(x1); f2 = func(x2);
%% Calculations
while es <= ea && iter < maxiter
    iter = iter + 1;
    if f1 < f2
        xopt = x2;
        xu = x1;
        x1 = x2;
        d = (phi-1)*(xu-xl);
        x2 = xu - d;
        f1=f2;
        f2=func(x2);
    else
        xopt = x1;
        xl = x2;
        x2 = x1;
        d = (phi-1)*(xu-xl);
        x1 = xl + d;
        f2=f1;
        f1=func(x1);
    end
    if xopt ~= 0
    ea = (2-phi)*abs((xu-xl)/xopt)*100;
    end
end
%% End Values
root = xopt; gx = func(xopt);
end

