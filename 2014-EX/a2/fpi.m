function xc=fpi(g,x0,k)
%% FPI:  Fixed-Point Iteration
%       Computes approximate solution xc of g(x)=x
%       Input: function handle g, initial guess x0, 
%           number of steps k
%       Output: approximate solution xc
%       Usage: xc=fpi(g,x0,k)
x = [x0;zeros(k,1)];
for i = 1:k
  x(i+1) = g(x(i))
end
xc = x(k+1);