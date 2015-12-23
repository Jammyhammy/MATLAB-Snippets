% Adil Khokhar
% CLID: axk9375
%
% Polynomial Interpolation
% Equation: Ax^3 + Bx^2 + Cx + D = y
% Data Points: (200, 0.746), (250, 0.675), (300, 0.616), (400, 0.525), 
%              (500, 0.457)
% A(200)^4 + B(200)^3 + C(200^2) + D(200) + E = 0.746
% A(250)^4 + B(250)^3 + C(250^2) + D(250) + E  = 0.675
% A(300)^4 + B(300)^3 + C(300^2) + D(300) + E  = 0.616
% A(400)^4 + B(400)^3 + C(400^2) + D(400) + E  = 0.525
% A(500)^4 + B(500)^3 + C(500^2) + D(500) + E  = 0.457
format long;
x = [200 250 300 400 500];
y = [0.746 0.675 0.616 0.525 0.457];
M = [200^4 200^3 200^2 200 1 0.746;
     250^4 250^3 250^2 250 1 0.675;
     300^4 300^3 300^2 300 1 0.616;
     400^4 400^3 400^2 400 1 0.525;
     500^4 500^3 500^2 500 1 0.457];
R = rref(M);

fprintf('Matrix of Coefficients\n');
disp(M);
fprintf('Solution Matrix');
disp(R);

P = [ R(1,6)
      R(2,6)
      R(3,6)
      R(4,6)
      R(5,6) ];
  
xP = -150:1:550;
yP = polyval(P, xP);
pf = polyfit(x,y,4);
fp = polyval(pf,xP);

plot(x,y,'ro',xP,yP,'b-',xP,fp,'r-')
title('Exam Question 1 - Polynomial Interpolation Plot')

cond(M)
disp('The condition number is extremely high so the matrix is ill-conditioned.')
disp('This means that the solution x is highly inaccurate after approximation')
disp('And so the solutions are no good because they are prone to large numerical')
disp('errors');

