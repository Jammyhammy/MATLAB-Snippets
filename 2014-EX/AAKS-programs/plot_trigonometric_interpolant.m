function [done] = plot_trigonometric_interpolant (n, m, f)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% ok = plot_trigonometric_interpolant (n, m, f) plots a trigonometric
% interpolant to the function f over the interval [0, 2\pi], with
% 2n+1 interpolating points and m points in the plot.  The trigonometric
% polynomial is of the form 
% a_0 + \sum_{k=1}^{2n+1} (a_j \cos(jx) + b_j \sin(jx).
% For example 
% ok = plot_trigonometric_interpolant(6, 1001, 'trig_interp_example') 
% will plot the trigonometric interpolant to the function in 
% trig_interp_example.m (supplied with these routines) [-\pi,\pi], 
% using 13 interpolation points and 1001 points for the plot. 

xi=linspace(0, 2*pi, 2*n+2);
yi=feval(f,xi);
a0=0;
for j=1:2*n+1
   a0=a0+yi(j)/(2*n+1);
end
for j=1:n
   s1=0;
   s2=0;
   for k=1:2*n+1
      s1=s1+yi(k)*exp(-i*j*xi(k))/(2*n+1);
      s2=s2+yi(k)*exp(i*j*xi(k))/(2*n+1);
   end
   a(j)=s1+s2;
   b(j)=i*s1-i*s2;
end

x=linspace(0,2*pi,m);
y=feval(f,x);
ya = trigonometric_interpolant_value (x, a0, a, b);
plot(x,y,'-',x,ya,'--') 
title('Dashed curve is the trigonometric interpolant')
done = true;