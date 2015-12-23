function [w] = simple_2d(x)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% This function can be used with newton_sys as an example of Newton's
% method for systems of equations.  It can be used to do problem 9 of
% Chapter 8 (Section 8.7).

w(1) = x(1)^2 - x(2)^2 + 1;
w(2) = 2*x(1)*x(2);
w=w';