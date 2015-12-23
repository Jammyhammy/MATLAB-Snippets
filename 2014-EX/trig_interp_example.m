function [y] = trig_interp_example(x)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
%    [y] = trig_interp_example(x)
%
% returns a value at the argument x. 

y = sqrt(pi^2-(x-pi).^2);
return