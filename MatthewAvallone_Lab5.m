%% Lab 5

%4 use polyval to find B(z)/A(z)
%5 use angle() for Hfpt
%7 dont need to explain
%8 use old function that plots all the graphs
%9 may be extra credit

%% 2

b = [0.1, -0.1176, 0.1];
a = [1, -1.7119, 0.81];

[H,w] = freqz(b,a);

figure(1)
plot(w,abs(H))
xlim([0 pi])
title('Mag-Frequency Response')
%% 3

n = 0:100;
x = cos(0.1*pi*n);
y = filter(b,a,x);

figure(2)
subplot(2,1,1)
stem(n,x)
xlabel('n')
title('x(n)')
subplot(2,1,2)
stem(n,y)
xlabel('n')
title('y(n)')
%% 4

z = exp(1i*0.1*pi);
Hfpt = polyval(b, z) / polyval(a, z);

%% 5

s = abs(Hfpt)*cos(0.1*pi*n + angle(Hfpt));
figure(4)
plot(n,y,n,s)
title('Comparing s(n) with y(n)')
xlabel('n')

%% 6

n = 0:100;
x = cos(0.3*pi*n);
y = filter(b,a,x);

figure(5)
subplot(2,1,1)
stem(n,x)
xlabel('n')
title('x(n)')
subplot(2,1,2)
stem(n,y)
xlabel('n')
title('y(n)')

%% 7 

zplane(b,a);
title('Pole-Zero Diagram')

%% 8

b1 = [1];
a1 = [1,-1.8,0.9];

b2 = [1];
a2 = [1,-1.8,0.72];

b3 = [1];
a3 = [1,-1.53,0.9];

b4 = [1];
a4 = [1,-1.4,-.72];

b5 = [1];
a5 = [1,0.85];

b6 = [1];
a6 = [1,0.95];

makeLab6Plots(b1,a1, 'y(n)= x(n)+1.8y(n-1)-0.9y(n-2)');
makeLab6Plots(b2,a2, 'y(n)= x(n)+1.6y(n-1)-0.72y(n-2)');
makeLab6Plots(b3,a3, 'y(n)= x(n)+1.53y(n-1)-0.9y(n-2)');
makeLab6Plots(b4,a4, 'y(n)= x(n)+1.4y(n-1)+0.72y(n-2)');
makeLab6Plots(b5,a5, 'y(n)= x(n)-0.85y(n-1)');
makeLab6Plots(b6,a6, 'y(n)= x(n)-0.95y(n-1)');

