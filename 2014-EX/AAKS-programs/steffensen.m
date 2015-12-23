function [x_star,success] = steffensen (x0, f, eps, maxitr)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
% [x_star,success] = steffensen (x0, f, eps, maxitr) 
%  does iterations of Steffensen's method,
%  using x0 as initial guess, and with function defined by y = f(x).  
%  For example, suppose an m-file xsqm2.m is available in Matlab's working 
%  directory, with the following contents:
%     function [y] = xsqm2(x)
%     y = x^2-2;
%     return
%  Then, issuing
%     [x_star,success] = steffensen (1.5, 'xsqm2', 1e-10, 100) 
%  from Matlab's command window will cause an approximation to the square
%  root of 2 to be stored in x_star.
%  Iteration stops successfully if the difference between  successive
%  iterates is less than eps, and iteration
%  stops unsuccessfully if maxitr iterations have been done
%  without stopping successfully.
%  On return:
%    success = 1 if iteration stopped successfully, and 
%    success = 0 if iteration stopped unsuccessfully.
%    x_star is set to the approximate solution to f(x) = 0
%           if iteration stopped successfully, and x_star
%           is set to x0 otherwise.
success = false;
diff=2*eps;
disp(' --------------------------------------------');
disp('          k         x0               x1 ');
disp(' --------------------------------------------');

 for k=1:maxitr
     hlp= feval(f,x0);
     x1=x0 - hlp*hlp/(feval(f,hlp+x0)-hlp);
     diff=abs(x1-x0);
     disp(sprintf(' %10.0f  %15.9f  %15.9f  ', k, x0, x1));
      x0=x1;
     if (diff < eps) % Exit if error tolerance is achieved.
         success = true;
         break
     end
 end
x_star = x0;
if (~success)
   disp('Warning: Maximum number of iterations reached');
end

