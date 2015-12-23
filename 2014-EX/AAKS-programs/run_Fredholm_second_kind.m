% Matlab script run_Fredholm_second_kind.m
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% This script displays the approximate solutions of an example Fredholm
% integral equation of the second kind, for various mesh sizes, to compare
% the error.

clear
n=2;
disp('     n      h       t(n1)        f(.5)')
for l=1:6
    n=2*n;
    h=1/n;
    n1=1+n/2;
    [t,f] = Fredholm_second_kind... 
        (n, 'example_Fredholm_g', 'example_Fredholm_kernel');
    disp(sprintf(' %5.0f %9.6f %9.6f %12.6f',n,h,t(n1),f(n1)))
end
plot(t,f);

    
