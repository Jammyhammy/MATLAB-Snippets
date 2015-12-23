function xf=fixedpt(g,x0,it)
%% Fixed point Itrations
%% Function g, initial x0, iterations it
x = [x0;zeros(it,1)];
disp(fprintf('Xi=%d, g=%s',x0,g));
for i=2:it
        x(i) = g(x(i-1));
end
xf=x(it+1);