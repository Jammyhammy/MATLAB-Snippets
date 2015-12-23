% Matlab script run_Runge_Kutta_2_for_systems.m
% Accompanying program for the text
%
%    Classical and Modern Numerical Analysis:
%    Theory, Methods and Practice
% by Azmy S. Ackleh, Edward J. Allen,
%    R. Baker Kearfott, and Padmanabhan Seshaiyer
%
%    (Taylor and Francis / CRC Press, 2009)
%
clear
clf
t0 = 0;
tf = 30;
n_steps = 500;
y0(1) = 550;
y0(2) = 100;

[t,y] = Runge_Kutta_2_for_systems(t0, tf, y0, 'Lotka_Volterra', n_steps);

subplot(1,2,1) 
set(gca,'fontsize',18,'linewidth',1.5);
plot(t,y(:,1),'g-',t,y(:,2),'b--','linewidth',1.5)
axis([0,tf,0,2000]);
xlabel('Time')
ylabel(' Populations')
subplot(1,2,2)
set(gca,'fontsize',18,'linewidth',1.5);
plot(y(:,1),y(:,2),'r-','linewidth',1.5)
xlabel('Prey Population')
ylabel('Predator Population')
