function [fval] = minus_32_x_cubed(x)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% This function is used as an example for solution of a 2-point linear
% boundary-value problem using a central difference approximation to the
% second derivative.

fval = -32.* x.^3;