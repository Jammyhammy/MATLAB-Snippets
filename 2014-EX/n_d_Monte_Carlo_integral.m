function [value] = n_d_Monte_Carlo_integral (n, m, n_cases, f)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% [value] = n_d_Monte_Carlo_integral (n, m, n_cases, f) returns a guess
% for the integral of a function f of n variables over the unit n-cube
% [0,1]^n, using m sample points.  The mean of these tries is returned in
% value and the estimated standard deviation is returned in deviation.
% This routine also prints the estimated value and estimated 
% for each try standard deviation.
%
% The string "f" is the name of an m-file containing the function to be
% integrated.  For example, if sum_of_squares.m contains
%
%    function [y] = sum_of_squares(x)
%    y = x'*x;
%
% then issuing
%
%    value = n_d_Monte_Carlo_integral (10, 5000, 5, 'sum_of_squares')
%
% will return an approximation to 10/3 in value by guessing at a 
% 10-dimensional integral, using 5000 sample points in each of 5 tries,
% resulting in a standard deviation of deviation.  
%
% The state of the random nuber generator is reset at each call of this
% function, so the results are reproducible.

rand('state',1);
value = 0;
disp('  try no.       m  est. mean   est. dev. ')
for icase=1:n_cases
   s1=0.0;
   s2=0.0;
   for i=1:m
      x=rand(n,1);
      fval = feval(f,x);
      s1=s1+fval/m;
      s2=s2+fval^2/m;
   end
   estmean=s1;
   value = value + estmean;
   eststdev=sqrt(s2-s1*s1)/sqrt(m);
   disp((sprintf(' %5.0f %10.0f %10.6f %10.6f', icase, m, estmean, eststdev)))
end
value = value / n_cases;

