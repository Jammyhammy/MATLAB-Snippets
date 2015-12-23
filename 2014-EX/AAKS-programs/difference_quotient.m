function [diff] = difference_quotient(f,x,h)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
%
% difference_quotient (f,x,h) returns the forward difference quotient of 
% f at x with stepsize h, as in formula (6.1), page 323 of the text.

fxph = feval(f,x+h);
fx = feval(f,x);
diff = (fxph-fx)/h;