% Adil Khokhar
% CLID: axk9375
% Exam 2 Question 3

clear all;

x = [ 0 5 10 20 30 40 ];
y = [ 1.787 1.519 1.307 1.002 0.7975 0.6529 ];

xi = 7.5;
hold on;
plot(x,y,'o')

xP = 0:1:50;
p = polyfit(x,y,1);
y2 = polyval(p,xP);
plot(xP,y2,'b-');
title('Exam Question 3 - Linear & Polynomial Plot')

p2 = polyfit(x,y,2);
y3 = polyval(p2,xP);
plot(xP,y3,'r-');

hold off;