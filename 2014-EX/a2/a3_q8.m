g=@(x) atan(x);
gd=@(x) 1/(x.^2+1);
maxit=20;
m_eps=10^-10;
x_g=-2:.1:2;       
%hold on;
%plot(x_g,atan(x_g));
%plot(x_g,0,'-o');
%grid;
%hold off;

format long g
x=-3:0.0001:3;
plot(x,atan(x)); 
grid on;
f=@(x) 2*x - atan(x) .* (1+x.^2);
df=@(x) 1 - 2 * x .* atan(x);
p = 1
for k=1:10 
	p = p - f(p)/df(p) 
end

hold on
plot([-p p],[0 atan(p)],'r',[-p p],[atan(-p) 0],'r')
hold off

x0=0.5;
newton(x0,g,gd,m_eps,maxit);
disp('---aa----------------------');

x0=1.0;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.3;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.4;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.35;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.375;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.3875;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.39375;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.390625;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');

x0=1.3921875;
newton(x0,g,gd,m_eps,maxit);
disp('-------------------------');