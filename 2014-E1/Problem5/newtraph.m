% newtraph: Newton-Raphson root location zeroes.
% [root, ea, iter] = newtraph(func,dfunc,xr,es,maxit,p1,p2,...):
% uses Newton-Raphson method to find the root of func
% input:
% func = function name, dfunc = deriv of func,
% xr = initial guess, es = relative error, maxit = max iterations
% p1, p2 = additional parameters by function
% output:
% root = real root, ea = apx rel. error %
% iter = num of iters

function [root,ea,iter]=newtraph(func,dfunc,xr,es,maxit,varagin)
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxit),maxit=50;end
iter = 0;
while (1)
    xrold = xr;
    xr = xr - func(xr)/dfunc(xr);
    iter = iter + 1;
    if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
    if ea <= es | iter >= maxit, break, end
end
root = xr;

