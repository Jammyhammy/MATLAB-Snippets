% Adil Khokhar
% CLID: axk9375
% Problem 5

% Set x to 1, make tan(x) function, and have step size be square root of
% machine eps.
x = 1;
f = @(x) tan(x);
h = sqrt(eps);
% Fixed point equation generated from equation 13.
dout = (f(x + (h * x)) - f(x))/ (h * x);

% True derivative function of tan(x).
dx = @(x) sec(x)^2;
fprintf(' Step Size: ');
fprintf(' %16.14f \n', h);

% Error when comparing approximate derivative from the fixed point equation
% and the actual derivative.
derr = abs(dx(x) - dout);
fprintf(' Error in approximation compared to sec(1)^2: ');
fprintf(' %16.14f \n', derr);

% For (b), use newton-raphson method to find roots for actual derivative
% and approximate derivative.

n_df = newtraph(f, dx, x);
n_dout = newtraph_d(f, dout, x);

% Find true error between the two functions.
nerr = abs(n_df - n_dout);

fprintf(' Newton-Raphson Root of actual derivative: ');
fprintf(' %16.14f \n', n_df);
fprintf(' Newton-Raphson Root of apx. derivative: ');
fprintf(' %16.14f \n', n_dout);
fprintf(' Error in Newton Raphson Root between actual derivative and approximation: ');
fprintf(' %16.14f \n\n', nerr);

% Write in a loop for (c) so that h decreases each iteration, and plot the
% graph.

h = 1;
H(1) = h;
D(1) = (f(x + (h * x)) - f(x))/ (h * x);
E(1) = abs(dx(1) - D(1));
for i = 2:17
    h = h/10;
    H(i) = h;
    D(i) = (f(x + (h * x)) - f(x))/ (h * x);
    E(i) = abs(dx(1) - D(i));
end

L = [H' D' E']';
fprintf('   step size    finite difference    true error\n');
fprintf('%16.14f %16.14f %16.14f\n',L);
loglog(H,E);
xlabel('Step Size'), ylabel('Error');
title('Plot of Error Versus Step Size');

% Once we go past h = sqrt(eps), due to rounding and truncation error from
% floating point numbers, the error starts to increase instead of decrease
% by an exponential factor as the step size h decreases.
