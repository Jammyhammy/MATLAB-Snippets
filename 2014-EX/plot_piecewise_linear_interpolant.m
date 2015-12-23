function [done] = plot_piecewise_linear_interpolant... 
                                  (a, b, n, m, f, use_hat)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% ok = plot_piecewise_linear_interpolant (a, b, n, m, f, use_hat) plots the
% piecewise linear interpolant to the function f over the interval [a,b],
% with n subintervals and m points in the plot.  If use_hat is false, this
% routine calls the routine piecewise_linear_interpolant_value to obtain
% the values of the interpolant for plotting, while this routine obtains
% those values with interpolant_with_hat_function_basis if use_hat is true.
% For example 
% ok = plot_piecewise_linear_interpolant(-5, 5, 10, 200, 'runge', 'true') 
% will plot the piecewise linear interpolant to the function in runge.m
% (supplied with these routines) over the interval [-5,5], using 10
% subintervals in the interpolant, using 200 points for the plot, and
% using hat functions to compute the interpolant.  If hat functions are
% used, the points need to be equally spaced for this particular
% implementation.  (This is not true in general.)

xi=linspace(a,b,n+1);
yi=feval(f,xi);
x=linspace(a,b,m);
y=feval(f,x);
if (use_hat)
    ya = interpolant_with_hat_function_basis (x, xi, yi);
else
    ya = piecewise_linear_interpolant_value  (x, xi, yi);
end
plot(x,y,'-',x,ya,'--') 
title('Dashed curve is the piecewise linear interpolant')
done = true;