% Matlab script run_composite_Newton_Cotes.m
%
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)

clear
a = 0; b = 10; m = 3;
[integral_value, success] = composite_Newton_Cotes('f_sin_x_over_xsqp1',...
    a, b, m, 0.000001)


