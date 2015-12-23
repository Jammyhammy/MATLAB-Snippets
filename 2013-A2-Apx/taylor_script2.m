% Adil Khokhar
% axk9375
% Assignment 2, problem 3

% With this script, we can see that as we increase the order of the Taylor
% series, the true percent relative error decreases exponentially. This
% means that the magnitude of the difference between the exact value of
% the given function and the approximation by the taylor series decreases as the
% orders increase.

clear all;
ff = @(x) log(x);
df = @(x) 1/x;
diffex(ff,df,2,6)