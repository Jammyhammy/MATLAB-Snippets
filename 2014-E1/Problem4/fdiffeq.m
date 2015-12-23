% Adil Khokhar
% CLID: axk9375
% Problem 4

function fdiffeq(func, dfunc, x)

% This function will approximate the derivative of a function using the
% finite difference equation. It will then plot the magnitude of the error
% as a function of h.

format long

% Initial values
dftrue = dfunc(x);
h = 1;
H(1) = h;
D(1) = (func(x+h) - func(x)) / h;
E(1) = abs (dftrue - D(1));

% Decrease the step size iteratively by a factor of 10 and approximate the
% derivative and error.
for i = 2:17
    h = h/10;
    H(i) = h;
    D(i) = (func(x+h) - func(x)) / h;
    E(i) = abs(dftrue - D(i));
end

% Plot the step size.
L = [H' D' E']';
fprintf('   step size    finite difference    true error\n');
fprintf('%16.14f %16.14f %16.14f\n',L);
loglog(H,E);
xlabel('Step Size'), ylabel('Error');
title('Plot of Error Versus Step Size');

% Compare with the error of when the step size is sqrt(eps).

h = sqrt(eps);
H(18) = h;
D(18) = (func(x+h) - func(x)) / h;
E(18) = abs (dftrue - D(18));
LL = [H(18)' D(18)' E(18)']';
fprintf('sqrt(EPS):step size    finite difference    true error\n');
fprintf('%16.14f %16.14f %16.14f\n',LL);

% We can see that when the step size is smaller than sqrt(eps), due to
% rounding and truncation errors with the floating point precision of the
% machine, the error increases by each step.

format short;

