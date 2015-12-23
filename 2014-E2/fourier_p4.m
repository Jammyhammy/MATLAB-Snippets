function F = fourier_p4( Ai, T, n )
sign = 1;
sum = 0;
t = 0:T/2:4*T;
k = length(t);

for j = 1:k
    F(1,k) = (((4 * Ai)/(2*n-1)*pi) * sin((2*pi*(2*pi-1) * t(k)/T)));
end

for i = 2:(n)
    for j = 1:k
    if sign ==  0
        F(n,j) = (((4*Ai)/(2*n-1)*pi) * sin((2*pi*(2*pi-1) * t(k) )/T));
        sign = 1;
    else
        F(n,j) = (((4*-Ai)/(2*n-1)*pi) * sin((2*pi*(2*pi-1) * t(k) )/T));
        sign = 0;
    end
    end
end
hold on;
for i = 1:(n)
    for j = 1:k
    sum = sum + F(i,j);
    end
end

plot(t,F,'b-');
plot(t,sum,'r-');
title('Exam Question 4 - Fourier Series Plot')
hold off;
end

