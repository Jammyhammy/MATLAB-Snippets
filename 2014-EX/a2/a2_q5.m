disp('Assignment 2 Q5a');
g=@(x) x-atan(x);
gd=@(x) (x.^2)/((x.^2)+1);
k=10;
x0=5;
x(1)=x0;
fprintf('i=0, G(x)=x-arctan(x), x=%d\n',x(1));

for i=2:k+1
    x(i)=g(x(i-1));
    m=i-1;
    fprintf('i=%d, G(x)=x-arctan(x), x=%d\n',m,x(i));
end
disp('-------------------------------------------------');
x0=-5;
x(1)=x0;
fprintf('i=1, G(x)=x-arctan(x), x=%d\n',x(1));
for i=2:k+1
    x(i)=g(x(i-1));
    m=i-1;
    fprintf('i=%d, G(x)=x-arctan(x), x=%d\n',m,x(i));
end

disp('-------------------------------------------------');
x0=1;
x(1)=x0;
fprintf('i=0, G(x)=x-arctan(x), x=%d\n',x(1));
for i=2:k+1
    x(i)=g(x(i-1));
    m=i-1;
    fprintf('i=%d, G(x)=x-arctan(x), x=%d\n',m,x(i));
end

disp('-------------------------------------------------');
x0=-1;
x(1)=x0;
fprintf('i=0, G(x)=x-arctan(x), x=%d\n',x(1));
for i=2:k+1
    x(i)=g(x(i-1));
    m=i-1;
    fprintf('i=%d, G(x)=x-arctan(x), x=%d\n',m,x(i));
end

disp('-------------------------------------------------');
x0=0.1;
x(1)=x0;
fprintf('i=0, G(x)=x-arctan(x), x=0.1\n');
for i=2:k+1
    x(i)=g(x(i-1));
    m=i-1;
    fprintf('i=%d, G(x)=x-arctan(x), x=%d\n',m,x(i));
end

