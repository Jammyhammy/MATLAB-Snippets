function difference_table(f,fprime,x)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% Issuing the command 
%    difference_table('f','fprime',x) 
% causes a table of difference quotients to be formed using the 
% difference_quotient function.  The string f can be either the name of a
% Matlab intrinsic function or a user-supplied m-file, while fprime is a
% similar pointer to its derivative.  The step sizes used are h = 1/4,
% h = 1/8, ... h = 1/4^{30}.  For example, issuing the command
%
%    difference_table('sin','cos',pi/4) 
%
% produces the followiong table:
%
%     1     2.50e-001    0.6118351194488110   -9.53e-002
%     2     6.25e-002    0.6845566203276636   -2.26e-002
%     3     1.56e-002    0.7015538499518499   -5.55e-003
%     4     3.91e-003    0.7057239167465070   -1.38e-003
%     5     9.77e-004    0.7067614018394579   -3.45e-004
%     6     2.44e-004    0.7070204574170020   -8.63e-005
%     7     6.10e-005    0.7070852015622222   -2.16e-005
%     8     1.53e-005    0.7071013863678672   -5.39e-006
%     9     3.81e-006    0.7071054324915167   -1.35e-006
%    10     9.54e-007    0.7071064440533519   -3.37e-007
%    11     2.38e-007    0.7071066969074309   -8.43e-008
%    12     5.96e-008    0.7071067616343498   -1.96e-008
%    13     1.49e-008    0.7071067765355110   -4.65e-009
%    14     3.73e-009    0.7071067988872528    1.77e-008
%    15     9.31e-010    0.7071068286895752    4.75e-008
%    16     2.33e-010    0.7071070671081543    2.86e-007
%    17     5.82e-011    0.7071075439453125    7.63e-007
%    18     1.46e-011    0.7071075439453125    7.63e-007
%    19     3.64e-012    0.7071228027343750    1.60e-005
%    20     9.09e-013    0.7071533203125000    4.65e-005
%    21     2.27e-013    0.7075195312500000    4.13e-004
%    22     5.68e-014    0.7070312500000000   -7.55e-005
%    23     1.42e-014    0.7109375000000000    3.83e-003
%    24     3.55e-015    0.7187500000000000    1.16e-002
%    25     8.88e-016    0.7500000000000000    4.29e-002
%    26     2.22e-016    1.0000000000000000    2.93e-001
%    27     5.55e-017    0.0000000000000000   -7.07e-001
%    28     1.39e-017    0.0000000000000000   -7.07e-001
%    29     3.47e-018    0.0000000000000000   -7.07e-001
%    30     8.67e-019    0.0000000000000000   -7.07e-001
%
% You could also issue, say, the command
%
%    difference_table('xsqm2', 'xsqm2_prime', 1)
%
% where xsqm2 and xsqm2_prime are supplied by you.  (See the in-line
% documentation for bisect.m.)

for i=1:30
   h=4^(-i);
   value = difference_quotient(f,x,h);
   error = value - feval(fprime,x);
   fprintf('%3d  %12.2e  %20.16f %12.2e\n', i, h, value, error);
end
clear value error
