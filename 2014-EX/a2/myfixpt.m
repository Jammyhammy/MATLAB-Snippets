function [k,xc,err,x] = myfixpt(g,x0,maxIt)

% Input - g is the iteration function 
%         input it as an inline function OR
%         write a Matlab function file for g , say myfun.m 
%         Then (IN MATLAB Command window)
%         >>[k,xc,err,x] = fixpt(@myfun,x0,tol,maxIt)  
%       - x0 is the initial guess for the fixed-point
%       - tol is the tolerance
%       - maxIt is the maximum number of iterations 
% Output - k is the number of iterations that were carried out
%	      - xc is the approximation to the fixed-point
%	      - err is the error in the approximation
%	      - x'contains the sequence {x_n}

%
x(1)=x0;
for k=2:maxIt
	x(k)=g(x(k-1));
	err=abs(x(k)-x(k-1));
	relerr=err/(abs(x(k))+eps);
end
xc=x(k);

if k == maxIt
	disp('maximum number of iterations exceeded')
end
x=x';

	 