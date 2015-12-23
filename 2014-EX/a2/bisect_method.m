function [root,success] =bisect_method (a, b, eps, f)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
% [root, success] = bisect_method (a, b, eps, func) returns the result
% of the method of bisection, with starting interval [a, b], 
% tolerance eps, and with function defined by y = f(x).  For example,
% suppose an m-file xsqm2.m is available in Matlab's working 
% directory, with the following contents:
%     function [y] = xsqm2(x)
%     y = x^2-2;
%     return
% Then, issuing
%     [root,success] = bisect (1, 2, 1e-10, 'xsqm2')
% from Matlab's command window will cause an approximation to
% the square root of 2 that, in the absence of excessive roundoff
% error, has absolute error of at most 10^{-16}
% to be returned in the variable root, and success to be set to
% 'true'.
%
% success is set to 'false' if f(a) and f(b) do not have the same
% sign.  success is also set to 'false' if the tolerance cannot be met.
% In either case, a message is printed, and the midpoint of the present
% interval is returned in the variable root.

% Algorithm 2.1 is basically used.  However,  Theorem 2.2 is used to
% compute the number of iterations N required for bisection to achieve
% that tolerance.  This is to avoid an infinite loop that might be
% caused by an excessively small tolerance (in which case the midpoint of
% the interval is repeatedly rounded to one of the end points and the
% tolerance is never met).
error=b-a;
fa=feval(f,a);
fb=feval(f,b);
success = true;

% First, handle incorrect arguments --
if (fa*fb > 0)
    disp('Error: f(a)*f(b)>0');
    success = false;
    root = a + (b-a)/2;
    return
end
if (eps <=0)
    disp('Error: eps is less than or equal to 0')
    success = false;
    root = a + (b-a)/2;
    return
end
if (b < a)
    disp('Error: b < a')
    success = false;
    root = (a+b)/2;
    return
end

% Set N to be the smallest integer such that N iterations of bisection
% suffices to meet the tolerance -- 
N = ceil( log((b-a)/eps)/log(2) - 1 )

% This is where we actually do Algorithm 2.1 --
disp('-------------------------------------------------------------------------------');
disp('i   Ak      Bk     F(Ak) F(Bk)   F(Xk)         Error          Estimate  ');
disp('-------------------------------------------------------------------------------');
for i=1:N
    
    x= a + (b-a)/2;
    fx=feval(f,x);
    if(fx*fa > 0)
        a=x;
    else
        b=x;
    end
    error=b-a;
    fprintf('%d | %6.4f | %6.4f | %d | %d | %6d | %12.4e | %12.4e\n', i, a, b, fa, fb, fx, error, x);
end

% Finally, check to see if the tolerance was actually met.  (With
% additional analysis of the minimum possible relative error as in Theorem
% 1.6 and Definition 1.5, unreasonable values of epsilon for the particular
% floating point system can be determined before the loop on i, avoiding
% unnecessary work.)
error = (b-a)/2;
root = a + (b-a)/2;
if (error > eps)
    disp('Error: epsilon is too small for tolerance to be met');
    success = false;
    return
end
