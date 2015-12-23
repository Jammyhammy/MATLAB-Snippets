% Matlab script run_inverse_power_method.m
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
for icase = 1:2
    lambda = .2;
    format short
    n = 3;
    if icase == 1
        A = 2*eye(n)-diag(ones(n-1,1),1)-diag(ones(n-1,1),-1)
    else
        A = hilb(n)
    end
    q0 = ones(n,1);
    [eig, v_1, success] = inverse_power_method (lambda, q0, A, 1e-6, 1000)
    A*v_1 - eig*v_1
end

