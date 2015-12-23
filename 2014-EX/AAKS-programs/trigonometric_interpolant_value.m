function [ya] = trigonometric_interpolant_value (x, a0, a, b); 
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% y = trigonometric_interpolant_value (x, a0, a, b) returns the
% vector of values of the trigonometric interpolant at corresponding
% coordinates of the vector x, corresponding to the coefficents a0, a, and
% b. (See plot_trigonometric_interpolant.m for an explanation of these
% coefficients.)
% The sizes of x and a should correspond exactly to the number
% of points to plot and the number of coefficients, respectively.

m = max(size(x));
n = (max(size(a))-1)/2;
ya=a0*ones(1,m);
for j=1:n
   ya = ya + a(j)*cos(j*x)+ b(j)*sin(j*x);
end
return
