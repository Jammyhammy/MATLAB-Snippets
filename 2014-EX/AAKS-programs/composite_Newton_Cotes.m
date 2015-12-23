function [integral_value,success] = composite_Newton_Cotes(f, a, b, m, eps);
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen, 
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% I = composite_Newton_Cotes(f, a, b, m, eps) computes an approximation to
% the integral of f over the interval a to b, using composite Newton-Cotes
% integration, according to the explanation in sections 6.3.1 and 6.3.2 of
% the text. f is a string giving the name of an "m" file containing the
% function to be integrated, a is the left end point of the integration
% interval, b is the right end point of the integration interval, and m is
% the number of points in the Newton-Cotes formula.  (Closed Newton-Cotes
% formulas are used.)  The weights for various m are stored in this
% routine, with valid values of m between 2 and 11. Computations stop when
% the approximation with 2n subintervals differs by less than eps from 
% the approximation with n subintervals, provided that can be achieved with
% less 15 doublings (2^{15} = 32768 subintervals.  'success' is set to
% false if the tolerance cannot be met, and is set to 'true' if it can.
%
% For example, suppose the m-file f_sin_x_over_xsqp1.m contains
%
%   function [y] = f_sin_x_over_xsqp1(x)
%   y = sin(x) / (x^2 + 1);
%   return
%
% Then, the following sequence will return an approximation to the integral
% of sin(x) / (x^{2} + 1) over the interval [0,10], using Simpson's rule,
% and with a stopping criterion for the composite integration process of
% eps = 0.000001:
%   clear
%   a = 0; b = 10; m = 3;
%   [integral_value, success] = composite_Newton_Cotes('f_sin_x_over_xsqp1',...
%       a, b, m, 0.000001)
switch m
    case 2 % Trapezoidal rule
        w = [1 1];
    case 3 % Simpson's rule
        w = [1/3 4/3 1/3];
    case 4 % The 3/8 rule
        w = 2 * [1/8 3/8 3/8 1/8];
    case 5 % Boole's rule
        w = (2/90) * [7 32 12 32 7];
    case 6
        w = (1/144) * [19 75 50 50 75 19];
    case 7
        w = (1/420) * [41 216 27 272 27 216 41];
    case 8
        w = (1/8640) * [751 3577 1323 2989 2989 1323 3577 751];
    case 9 % Note weights of opposite signs, bad for roundoff error --
        w = (1/14175) * [989 5888 -928 10496 -4540 10496 -928 5888 989];
    case 10 
        w = (1/44800) * [2857 15741 1080 19344 5778 5778 19344 1080 15741 2857];
    case 11 % Expect this formula to have very bad roundoff properties --
        w = (1/299376) * ...
            [16067 106300 -48525 272400 -260550 427368  -260550 272400 -48525 106300 16067];
    otherwise
        disp('Error in composite_Newton_Cotes:')
        disp(sprintf('The case m = %3f points is not implemented.', m))
        success = false;
        integral_value = (b-a)*feval(f,(a+b)/2);
        return
end
x = linspace(-1,1,m);
n=1;
error=2*eps;
success = false;
sm2=1000.0;
n_doubling = 0;
while error > eps
    n=2*n;
    n_doubling = n_doubling + 1;
    if n_doubling > 15
        success = false
        disp(sprintf('composite_Newton_Cotes could not achieve accuracy eps = %12.9e', eps))
        integral_value = sm2;
        return
    end
    h=(b-a)/n;
    s=0;
    for j=1:n
      ss=0;
      aa=a+(j-1)*h;  %left endpoint of jth subinterval
      for k=1:m
         z = (x(k)+1)*h/2 + aa;
         ss = ss + feval(f,z)*w(k)*h/2.0;
      end
      s=s+ss;
    end
    sm1=sm2;
    sm2=s;
    error=abs(sm2-sm1);
    disp(sprintf(' %9.0f   %12.6f ',n,sm2));
end
success = true;
integral_value = sm2;