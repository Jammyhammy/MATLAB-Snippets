function [ya] = piecewise_linear_interpolant_value (x, xi, yi); 
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

m = max(size(x));
n = max(size(xi))-1;
for i=1:m
   for j=1:n
      if(xi(j) <= x(i) & x(i) <= xi(j+1))
         hlp=xi(j+1)-xi(j);
         ya(i)= yi(j)*(xi(j+1)-x(i))/hlp + yi(j+1)*(x(i)-xi(j))/hlp;
      end
   end
end
return
