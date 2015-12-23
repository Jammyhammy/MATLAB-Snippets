function [y] = runge(x)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
%    [y] = runge(x)
%
% returns Runge's function at the argument x.  If x is a vector, then, upon
% return, y will contain the vector of evaluations of Runge's function at
% corresponding components of x.  In such a case, y will be a row vector if
% x is a row vector, and y will be a column vector if x is a column vector.

y = 1./(1+x.^2);
return