% run_steffensen.m
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
% This Matlab script runs steffensen.m on the example xsqm2.m
clear
[root,I_finished] = steffensen(1.5, 'xsqm2', 1e-10, 50)

% plot the function to gain some insight --
x = linspace(0,2,1001);
y = feval('xsqm2',x);
plot(x,y);