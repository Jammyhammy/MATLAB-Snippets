function [t,y] = Adams_Bashforth_order_3(t0, tf, y0, f, n_steps)
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
% [t,y] = Adams_Bashforth_order_3(t0, tf, y0, f, n_steps) performs 
% n_steps an Adams Bashforth order 3 multistep method (explained in 
% Section 7.5 of the text), on the system represented by the 
% right-hand-side function f, with constant step size h = (tf - t0)/nsteps, 
% and starting with initial independent variable value t0 and initial 
% dependent variable values y0. The corrsponding independent and dependent 
% variable values are returned in t(1:n_steps+1) and y(1:n_steps+1,:), 
% respectively.  The first two steps of the method are done with a
% fourth-order Runge Kutta method.
%
% For example, if the file Lotka_Volterra.m contains
%
%    function [f] = Lotka_Volterra (t, y)
%    f(1)=.5*y(1)-.005*y(1)*y(2);
%    f(2)=  -y(2)+.001*y(1)*y(2);
%
% then 
% [t,y] = Adams_Bashforth_order_3(0,30, [550;100], 'Lotka_Volterra', 500)
% will return 501 independent variable values 0, 1/500, 2/500, ..., 30, 
% 501 vector values [y(:,1), y(:,2)]  that correspond to the approximate solution
% to the system dy/dt = f(t,y), y_0 = [550;100], at the components of the
% vector t. (The arrays t and y can then be used for plotting solution
% components.)

h = (tf - t0) / n_steps;
t=linspace(t0,tf,n_steps+1);
y(1,:) = y0 % y(1,:) are the initial values at t=t0
for i=1:2
    k1=h*feval(f,t(i),y(i,:));
    k2=h*feval(f,t(i)+h/2,y(i,:)+k1/2);
    k3=h*feval(f,t(i)+h/2,y(i,:)+k2/2);
    k4=h*feval(f,t(i)+h,y(i,:)+k3);
    y(i+1,:)=y(i,:)+(k1+2*k2+2*k3+k4)/6;
end      % k1, k2, k3, k4, f, and y(i,:) are vectors of length nsys
for i=3:n_steps
    hlp= 23*feval(f,t(i),y(i,:))...
        -16*feval(f,t(i-1),y(i-1,:)) + 5*feval(f,t(i-2),y(i-2,:));
    y(i+1,:)=y(i,:)+h*hlp/12;
end

