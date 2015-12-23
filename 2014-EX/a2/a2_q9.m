f=@(x) x.^2-2;
fd=@(x) 2*x;
maxit=15;
m_eps=eps;
x=[ 2 4 8 16 32 64 ];
x_g = linspace(-3,3,60);
hold on;
plot(x_g,f(x_g));
plot(x_g,0,'-');
hold off;

x0=x(1)
newton(x0,f,fd,m_eps,maxit);
disp('-------------------------');

x0=x(2)
newton(x0,f,fd,m_eps,maxit);
disp('-------------------------');

x0=x(3)
newton(x0,f,fd,m_eps,maxit);
disp('-------------------------');

x0=x(4)
newton(x0,f,fd,m_eps,maxit);
disp('-------------------------');

x0=x(5)
newton(x0,f,fd,m_eps,maxit);
disp('-------------------------');

x0=x(6)
newton(x0,f,fd,m_eps,maxit);
disp('-------------------------');
