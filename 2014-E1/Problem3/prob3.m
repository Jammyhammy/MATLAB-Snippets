% Adil Khokhar
% CLID: axk9375
% Problem 3

% Set up the initial values.
x = 0:1:20;
xi = 0.016;

% Implement the equation into MATLAB.
k = (4 + x)./((42 - 2 .* x).^2 .* (28 - x));
fk = @(x) (4 + x)/((42 - 2 * x)^2 * (28 - x));

% (a) Provide the graph of the function.
plot(x,k);
xlabel('x range'), ylabel('k');

% (b) Use MATLAB root finding function and set the optimset options to make
% it display what it does to solve the function.

options = optimset('Display','iter');

fzero(fk, xi, options);

% (c) First the function looks for a sign change around the initial 
% interval using golden search, then once it finds a sign change, the 
% search will head in the opposite direction using interpolation to find
% a zero.