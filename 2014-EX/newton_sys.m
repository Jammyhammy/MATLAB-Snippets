function [x_star,success] = newton_sys (x0 ,f , f_prime, eps, maxitr)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% [x_star,success] = newton_sys(x0,f,f_prime,eps,maxitr) 
%  does iterations of Newton's method for systems,
%  using x0 as initial guess, f (a character string giving
%  an m-file name) as function, and f_prime (also a character
%  string giving an m-file name) as the derivative of f.  
%  iteration stops successfully if ||f(x)|| < eps, and iteration
%  stops unsuccessfully if maxitr iterations have been done
%  without stopping successfully or if a zero derivative
%  is encountered.
%  On return:
%    success = 1 if iteration stopped successfully, and 
%    success = 0 if iteration stopped unsuccessfully.
%    x_star is set to the approximate solution to f(x) = 0
%           if iteration stopped successfully, and x_star
%           is set to x0 otherwise.
% This program was produced from minor modification of newton.m.

success = 0;
x = x0;
for i=1:maxitr;
   fval = feval(f,x);
   i
   x
   norm_fval = norm(fval,2)
   if norm_fval < eps;
      success = 1;
      x_star = x;
      return;
   end;
   fpval = feval(f_prime,x);
   if fpval == 0;
      x_star = x0;
   end;
   v = fpval \(-fval);
   x = x +v;
end;
x_star =x0;
if (~success)
   disp('Warning: Maximum number of iterations reached');
end

   