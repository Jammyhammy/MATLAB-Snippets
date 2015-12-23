% Adil Khokhar
% CLID: axk9375
% Problem 4

format long;

% Make a tan(x) function and its derivative.
fx = @(x) tan(x);
x = 1;
df = @(x) sec(x)^2;
% Call fdiffeq
fdiffeq(fx,df,x);