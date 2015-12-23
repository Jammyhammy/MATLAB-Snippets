function [gval] = example_Fredholm_g(t)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
gval = exp(t)*(exp(1)-3)/7 + 191*t/84 - (16*t.^2) / 7;
