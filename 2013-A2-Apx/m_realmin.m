% Adil Khokhar
% axk9375
% Assignment 2, problem 2

function m_realmin()
% Determines smallest possible real number
format long;
r = 2;
while(1)
    z = r/2;
    if z <= 0, break, end
    r = r/2;
end
disp(r);