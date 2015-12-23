% Adil Khokhar
% CLID: axk9375
% Problem 2 c

% Start on first term.
clear all;
f_error = 1;
b_error = 1;
x = 1;
a = 1;
y = (x + 1)^a;
% The first term is 1.
F = 1;
F_coeff = 1;

% The loop does not work, the program will hang because the error becomes not a number and the coefficient goes to infinity.

while (1)
for i = 1:a
    F_old = F;
    F_coeff_old = F_coeff;
    F_coeff_new = ((a - i) + 1);
    F_coeff = F_coeff_old * F_coeff_new;
    F = F_old + ((F_coeff/factorial(i)) * (x^i));
    F_new = F + (((F_coeff * ((i + 1)))/factorial(i+1)) * (x^(i+1)));
end
f_error = abs((F_new - F)/(((x+1)^(a+1)) - y));
b_error = abs((F - F_old)/((y - ((x+1)^(a-1)))));
a = a+1;
if f_error == sqrt(eps), break, end
end