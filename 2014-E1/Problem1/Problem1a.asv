% Adil Khokhar
% CLID: axk9375
% Problem 1
% Plots a graph to show the taylor series expansion for up until the 7th
% order taylor series. (a) has the first 4 series, and in order to get (b),
% we must have 7th order Taylor Series.
% Set up initial values.

format long;

x = -1*pi : pi/2 : 2*pi;
y = x - 1 - 0.5 * sin(x);
a = pi/2;

func = @(x) 1*x;
% Put in the derivatives
f = @(x) x - 1 - 0.5 * sin(x);
f1 = @(x) 1 - 0.5 * cos(x);
f2 = @(x) 0.5 * sin(x);
f3 = @(x) 0.5 * cos(x);
f4 = @(x) -0.5 * sin(x);
f5 = @(x) -0.5 * cos(x);
f6 = @(x) 0.5 * sin(x);
f7 = @(x) 0.5 * cos(x);
f8 = @(x) -0.5 * sin(x);
f9 = @(x) -0.5 * sin(x);
f10 = @(x) 0.5 * sin(x);
f11 = @(x) 0.5 * cos(x);

% Expand as taylor series up to the 7th Order (so to do both (a) and (b))
t = f(a) * x.^0;
t1 = t + (f1(a) + (x - a));
t2 = t1 + ((f2(a))/factorial(2)) * (x - a) .^2;
t3 = t2 + ((f3(a))/factorial(3)) * (x - a) .^3;
t4 = t3 + ((f4(a))/factorial(4)) * (x - a) .^4;
t5 = t4 + ((f5(a))/factorial(5)) * (x - a) .^5;
t6 = t5 + ((f6(a))/factorial(6)) * (x - a) .^6;
t7 = t6 + ((f7(a))/factorial(7)) * (x - a) .^7;
t8 = t7 + ((f8(a))/factorial(8)) * (x - a) .^8;
t9 = t8 + ((f9(a))/factorial(9)) * (x - a) .^9;
t10 = t9 + ((f10(a))/factorial(10)) * (x - a) .^10;

% Find the error for up to fourth-order. The value for t is 3, which is
% pi/2.

e = abs(f(pi/2) - t(3));
disp('Error 1st Order:');
disp(e);

e1 = abs(f(pi/2) - t1(3));
disp('Error 2nd Order:');
disp(e1);

e2 = abs(f(pi/2) - t2(3));
disp('Error 3rd Order:');
disp(e2);

e3 = abs(f(pi/2) - t3(3));
disp('Error 4th Order:');
disp(e3);

e4 = abs(f(pi/2) - t4(3));
disp('Error 5th Order:');
disp(e4);

% Plot the graph.
for i = 1:7
    ee(i) = (f(x(i)) - t(i));
    ee1(i) = (f(x(i)) - t1(i));
    ee2(i) = (f(x(i)) - t2(i));
    ee3(i) = (f(x(i)) - t3(i));
end;

hold on;
%plot(x,y,'-ro');
plot(x,ee,'-r+');
plot(x,ee1,'-k*');
plot(x,ee2,'-md');
plot(x,ee3,'-ms');
%plot(x,t4,'-b.');
hleg1 = legend('E(1) First-Order','E(2) Second-Order','E(3) Third-Order','E(4) Fourth-Order');
set(hleg1,'Location','SouthEast');
xlabel('Range');
ylabel('Error Size');
hold off;

e7 = abs(f(pi/2) - t7(3));
disp('Error 7th Order:');
disp(e7);
e9 = abs(f(pi/2) - t9(3));
disp('Error 9th Order:');
disp(e7);
e10 = abs(f(pi/2) - t10(3));
disp('Error 10th Order:');
disp(e10);