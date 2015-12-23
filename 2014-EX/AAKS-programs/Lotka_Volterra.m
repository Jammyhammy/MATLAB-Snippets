function [f] = Lotka_Volterra (t, y)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% This function can be used in our demonstration ODE solvers, such as
% Runge_Kutta_2_for_systems.m.
%
% A Lotka-Volterra population model is assumed here.
% y(1) is prey population and y(2) is predator population.

f(1)=.5*y(1)-.005*y(1)*y(2);
f(2)=  -y(2)+.001*y(1)*y(2);
return
