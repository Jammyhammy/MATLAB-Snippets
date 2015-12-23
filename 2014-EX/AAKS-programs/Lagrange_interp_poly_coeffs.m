function [coeffs] = Lagrange_interp_poly_coeffs(degree,f,a,b)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
%    [a] = Lagrange_interp_poly_coeffs(d,f,a,b)
%
% returns the coefficients of the interpolating polynomial to f of degree d
% with equally spaced points over the interval [a,b].  For example, suppose
% the file runge.m contains Runge's function, as follows:
%
%    function [y] = runge(x)
%    y = 1./(1+x.^2);
%    return
%
% Then, issuing the command
%
%    [a] = Lagrange_interp_poly_coeffs(10,'runge',-5,5)
%
% will return the 11 coefficients, in order of increasing degree, for the
% Lagrange interpolating polynomial for Runge's function, using 11 equally
% spaced points on the interval [-5,5]; the vector a will be a column
% vector with space for exactly 11 coefficients, i.e. size(a) = [11   1].

% Define the polynomial degree and end points of the interval --

n = degree;
h = (b-a)/(n);
np1 = degree+1;

% Construct the abscissas --

for i =1:np1;
    x(i) = a + (i-1)*h;
end

% Evaluate the function at the abscissas --

y = feval(f,x);
y=y';

% Set up the Vandermonde system --

A = zeros(np1,np1);
A(:,1) = 1;
for j=2:np1
    for i=1:np1
        A(i,j) = x(i)^(j-1);
    end
end

% Solve the system --

coeffs = A\y;




