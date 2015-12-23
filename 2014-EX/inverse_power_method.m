function [lambda_1, v_1, success] = inverse_power_method...
    (lambda, q0, A, tol, maxitr)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% [lambda_1, v_1, success]=inverse_power_method(lambda, q0, A, tol, maxitr)
% computes an eigenvalue and eigenvector of the matrix A, according to the
% inverse power method as described in Section 5.3 (starting on page 303)
% of the text.  The eigenvalue is approximated using a Rayleigh quotient
% (described on page 300 of the text).  Iteration stops when either maxitr
% iterations of (5.19) have been reached, or the magnitude of the
% difference between successive eigenvalue approximations is less than tol.
% 'success' is set to true if the difference between successive
% approximations is less than tol upon return, and is set to 'false'
% otherwise.  In any case, lambda_1 is set to the most recent approximation
% to the eigenvalue and v_1 is set to the most recent approximation to the
% eigenvector, normalized to infinity norm 1.
n = size(A,1)
a=inv(A-lambda*eye(n));
q_nu = q0;
alam=2*norm(q_nu,inf);
check=1;
success = false;
for k=1:maxitr
    k=k+1;
    alam2=alam;
    q_nu=a*q_nu;
    q_nu=q_nu/norm(q_nu,inf);
    alam=(q_nu'*a*q_nu)/(q_nu'*q_nu);
    check=abs(alam-alam2);
    if (check < tol)
        success = true;
        break
    end
end
lambda_1=lambda+(1/alam);
v_1 = q_nu;
disp(sprintf(' %9.0f %15.4f %15.5f ',k,lambda,lambda_1));
