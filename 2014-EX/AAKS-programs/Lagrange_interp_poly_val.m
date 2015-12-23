function [y] = Lagrange_interp_poly_val(a,x)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
%    [y] = Lagrange_interp_poly_val(a,x)
%
% returns the value of the Lagrange interpolating polynomial with
% coefficients a (computed by Lagrange_interp_poly_coeffs.m) in y.
% If x is a vector, then, upon return, y will contain the vector of 
% evaluations of Runge's function at corresponding components of x.  
% In such a case, y will be a row vector if x is a row vector, and y will 
% be a column vector if x is a column vector.

n = size(a,1);
y = a(1);
for i = 2:n;
    y = y + a(i).*x.^(i-1);
end
