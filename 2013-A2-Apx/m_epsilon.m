% Adil Khokhar
% axk9375
% Assignment 2, problem 1

function m_epsilon()

% 1:Set eps to 1 
% 2:if (1+eps) is <= 1, goto step 5, otherwise step 3
% 3:set eps to  eps/2
% 4: goto step 2
% 5: eps = 2 * eps

eps = 1;

while(1)
    epx = 1 + eps;
    if epx <= 1, break, end
    eps = eps/2;
end
eps = 2 * eps;
disp(eps);