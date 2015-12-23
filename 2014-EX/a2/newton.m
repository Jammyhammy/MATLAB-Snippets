function [x_star,success] = newton (x0, f, f_prime, eps, maxitr)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
% [x_star,success] = newton(x0,f,f_prime,eps,maxitr) 
% does iterations of Newton's method for a single variable,
% using x0 as initial guess, f (a character string giving
% an m-file name) as function, and f_prime (also a character
% string giving an m-file name) as the derivative of f.  
% For example, suppose an m-file xsqm2.m is available in Matlab's working 
% directory, with the following contents:
%    function [y] = xsqm2(x)
%    y = x^2-2;
%    return
% and an m-fine xsqm2_prime is also available, with the following
%    function [y] = xsqm2_prime(x)
%    y = 2*x;
%    return
% contents:
% Then, issuing
%    [x_star,success] = newton(1.5, 'xsqm2', 'xsqm2_prime', 1e-10, 20) 
% from Matlab's command window will cause an approximation to the square
% root of 2 to be stored in x_star.
% iteration stops successfully if |f(x)| < eps, and iteration
% stops unsuccessfully if maxitr iterations have been done
% without stopping successfully or if a zero derivative
% is encountered.
% On return:
%    success = 1 if iteration stopped successfully, and 
%    success = 0 if iteration stopped unsuccessfully.
%    x_star is set to the approximate solution to f(x) = 0
%           if iteration stopped successfully, and x_star
%           is set to x0 otherwise.

success = 0;
x = x0;
for i=1:maxitr;
   fval = feval(f,x);
   if abs(fval) < eps;
      success = 1;
      disp(sprintf(' %10.0f  %15.9f  %15.9f ', i, x, fval));
      x_star = x;
      return;
   end;
   fpval = feval(f_prime,x);
   if fpval == 0;
      x_star = x0;
   end;
   disp(sprintf(' %10.0f  %15.9f  %15.9f ', i, x, fval));
   x = x - fval / fpval;
end;
x_star =x0;
   