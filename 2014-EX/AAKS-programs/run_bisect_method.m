% run_bisect_method.m
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
% This Matlab script is an example of how to run bisect.m
clear
a = 1
b = 2
eps = 1e-10
[root,success] = bisect_method(a, b, eps, 'xsqm2')