% Matlab script plot_Runge_and_Lagrange_interpolant.m
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% This script first computes the coefficients of the degree 10 Lagrange
% interpolating polynomial (in terms of powers of x) with equally spaced
% points over the interval -5 to 5 to Runge's function, then plots both 
% the values of this interpolating polynomial and the values of Runge's
% function with 200 equally spaced points on the interval [-5,5].

[a] = Lagrange_interp_poly_coeffs(10,'runge',-5,5);

xpts = linspace(-5,5,200);
z1 = Lagrange_interp_poly_val(a,xpts);
z2 = 1./(1+xpts.^2);;
plot(xpts,z1,xpts,z2);
