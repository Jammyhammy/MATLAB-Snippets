% Matlab script run_two_point_BVP_with_finite_differences
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% This solves a 2-point boundary value problem approximately, 5 times, 
% halving the mesh each time.

clear
clf
n=2;
disp('     n      h        x(n1)        u(.5)')
for l=1:5
    n=2*n;
    n1=n/2;
    [x,u] = two_point_BVP_with_finite_differences...
        (n, 0, 1, 0, 0, 'minus_32_x_cubed');
    disp(sprintf(' %5.0f %9.5f %9.4f %12.5f',n,1/n,x(n1),u(n1)))
end
plot(x,u)
xlabel('x')
ylabel('u(x)')
