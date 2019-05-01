function [I] = Simpson(x,y,varargin)
%Simpson Computes an integral with a one dimension array y with respect to
%another one dimension array x using Simpon's 1/3 Rule.
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
%Created by Michael Irlbeck on 4/15/2019.
%Modified:
%$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
%   Inputs:
%       x = one dimension array of data points
%       y = one dimension array of data points with respect to x
%   Outputs:
%       I = integral under the data points
%% Error Testing
if nargin ~= 2
    error('Must input two and only two inputs.')
end
if length(x) < 2 || length(y) < 2
    error('Inputs x and y must be vectors.')
end
if length(x) ~= length(y)
    error('Inputs x and y must be the length one dimensional arrays.')
end
if max(diff(diff(x))) > eps(1)*1000 % ensuring that differences are insanely small, almost zero
        error('The x input must include data that is evenly spaced.')
end
%% Computations
n = length(x)-1; %number of segments
n_constant = n+1; 
n_new = n_constant;
if mod(n,2) == 1
    warning('Warning: number of segments is odd instead of even so last segment will be computed with the trapezoidal rule')
    n_new = n_new - 1; %makes n even so 1/3 rule can be used
end
I = (x(n_new) - x(1))/(3*(n_new-1))*(y(1)+y(n_new)+4*sum(y(2:2:n_new))+2*sum(y(3:2:n_new-1))); %1/3 rule application
if n_new ~= n_constant %if trapezoidal rule needs to be used
    val2 = (x(n_constant) - x(n_new))*(y(n_constant)+y(n_new))/2; %n = 1
    I = I + val2;
end
%% original spacing method
%equal = isequal(x,linspace(x(1),x(length(x)),length(x)));
   % if equal == 0 error, end
end

