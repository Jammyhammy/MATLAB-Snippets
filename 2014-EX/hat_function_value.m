function p = hat_function_value (j, xi, n, h, z);
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% This is an auxiliary routine used by interpolant_with_hat_function_basis.

p=0;
if(j==1 & xi(1) <= z & z <=xi(2))
   p=(xi(2)-z)/h;
elseif (j==n+1 & xi(n) <= z & z <= xi(n+1))
   p=(z-xi(n))/h;
elseif( 2 <= j & j <= n & xi(j-1) <= z & z <= xi(j))
     p=(z-xi(j-1))/h;
elseif (2 <= j & j <= n & xi(j) <= z & z <= xi(j+1))
     p=(xi(j+1)-z)/h;
end
return
