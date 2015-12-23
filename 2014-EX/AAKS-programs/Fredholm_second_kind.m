function [t,f] = Fredholm_second_kind (n, g, K)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% [t,f] = Fredholm_second_kind (n, g, K) returns a set of n+1 points
% equally spaced in [0,1] (with n subintervals), and the corresponding
% approximate solution to the Fredholm integral equation of the second
% kind: f(t) = \int_0^1 k(t,s) f(s) ds + g(t).  The technique in Section
% 10.2.2.2 (Formula (10.73)) is used, with w_j = 1 for each interior 
% node, and w_1 = 2_{n+1} = 1/2.  The corresponding dense system of
% equations is solved using Matlab's intrinsic procedures for solving dense
% linear systems (matrix left division "\").

t=linspace(0,1,n+1)';
g_array = feval(g,t);
h = 1/n;
for i=1:n+1
    for j=1:n+1
        w(j)=h;                               %Trapezoidal rule
        if(j==1 | j==n+1) w(j)=h/2; end       %Trapezoidal rule
        %w(j)=2*h/3;                          %Simpson's rule
        %if(j==1 | j==n+1) w(j)=h/3; end      %Simpson's rule
        %if(j==2*floor(j/2)) w(j)=4*h/3; end  %Simpson's rule
        k(i,j)=w(j)*feval(K,t(i),t(j));
    end
end

% Complete definition of the matrix and solve the resulting linear system -
A = eye(n+1) - k;
f= A\g_array;

return