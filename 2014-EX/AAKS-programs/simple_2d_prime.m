function [J] = simple_2d_prime(x)
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

J(1,1) = 2*x(1); J(1,2) = -2*x(2);
J(2,1) = 2*x(2); J(2,2) =  2*x(1); 