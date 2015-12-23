function randptgen()

t = linspace(0,2*pi,64);
y = cos(10*t)+sin(3*t);
for i = 1:length(t)
    k = 1;
    y(i) = randn * y(i);
end
df = fft(y);
plot(t,df);
title('Exam Question 5 - DFT Plot')
return
end

