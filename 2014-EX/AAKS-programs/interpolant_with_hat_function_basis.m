function [ya] = interpolant_with_hat_function_basis(x,xi,yi);
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% y = piecewise_linear_interpolant_value (x, xi, yi) returns the
% vector of values of the piecewise linear interpolant at corresponding
% coordinates of the vector x, corresponding to the data set whose
% abscissas are in the vector xi and whose ordinates are in the vector yi.
% The size of x and the size of xi should correspond exactly to the number
% of points to plot and the number of abscissas, respectively.
%
% For this implementation, the abscissas xi must be equally spaced. (This
% function can be generalized so this is not a requirement.)

m = max(size(x));
n = max(size(xi))-1;
h = (xi(n+1) - xi(1)) / n;
for i=1:m
   s=0;
   for j=1:n+1
      s = s + yi(j)* hat_function_value (j,xi,n,h,x(i));
   end
   ya(i)=s;
end
return
