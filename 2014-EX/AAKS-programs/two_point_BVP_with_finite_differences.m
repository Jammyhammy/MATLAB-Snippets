function [x,u] = two_point_BVP_with_finite_differences...
    (n, a, b, u_a, u_b, f)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% [x,u] = two_point_BVP_with_finite_differences (n, a, b, f)
% computes an approximate solution to the linear two-point boundary value 
% problem
%
%    d^2 u / dx^2 = f(x), u(a) = u_a, u(b) = u_b 
%
% using a central difference approximation to d^2 u / dx^2, with a uniform
% mesh with h = (b-a) / n spacing.
%
% For efficiency, the matrix is stored in sparse format.  This makes the
% program more complicated, but is often worth it, except for simple
% illustrations, because it reduces the amount of work from order N^3 to
% order N, where N is the order of the linear system to be solved.
%
% For example, if minus_32_x_cubed.m contains
%   
%    function [fval] = minus_32_x_cubed(x)
%    fval = -32.* x.^3;
%
% then 
%    [x,u] = two_point_BVP_with_finite_differences...
%              (100, 0, 1, 0, 0, 'minus_32_x_cubed')
% will return the 99 equally spaced values 1/100, ..., 99/100 in the 
% column vector x, and corresponding approximate solution values
% to d^2 u / dx^2 = -32x^3, u(0) = u(1) = 0 in the column vector u.

h = (b-a)/n;

% Specify the mesh x and right-hand-side b --
x = linspace(a+h,b-h,n-1)';
b = h^2 * feval(f,x);

%  Add in the boundary conditions to the right-hand-side vector --
b(1) = b(1) - u_a;
b(n-1) = b(n-1) - u_b;

% Define the diagonal entries of the matrix A, then form A as a sparse
% matrix.  (Look up 'spdiags' in the Matlab help system.) --
B      = zeros(n-1,3);
B(:,2) = -2*ones(n-1,1);
B(:,1) = ones(n-1,1);
B(:,3) = ones(n-1,1);
A = spdiags(B,[-1;0;1],n-1,n-1);

% Compute the actual solution to the system --
u = A \ b;
