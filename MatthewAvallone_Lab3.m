%%Matthew Avallone
%%Lab 3

%%1 Convolution of Non-Causal Signals

n = -5:5;
u = @(n) double(n >= 0); %step function
d = @(n) double(n == 0); %delta function

f = @(n) 3.*d(n+2) - d(n-1) + 2.*d(n-3);
g = @(n) u(n+4) - u(n-3);
x = conv(f(n),g(n));

figure(1)

subplot(1, 3, 1)
stem(n, f(n));
title('f(n)')
xlabel('n')

subplot(1, 3, 2)
stem(n, g(n));
title('g(n)')
xlabel('n')

subplot(1, 3, 3)
stem(0:20, x);
title('x(n)')
xlabel('n')

%% 2 Smoothing Data

load DataEOG.txt
x = DataEOG;

figure(2)
subplot(1,2,1)
stem(x)
title('Stem Plotted Graph')
xlabel('n')
subplot(1,2,2)
plot(x)
title('Plot Graph')
xlabel('n')

h = ones(1,11)/11;
figure(3)
stem(h)
title('Impluse Response 1/11')
xlabel('n')

y = conv(x,h);
figure(4)
plot(y)
title('y(n)')
xlabel('n')

%c
figure(5)
plot(x), hold on
plot(y), hold off
title('Plot of X and Y')
xlabel('n')

%d
y2 = y;
y2(1:5) = [];
y2(end-4:end) = [];

figure(6)
plot(x), hold on
plot(y2), hold off
title('Plot of X and Y2')
xlabel('n')

%e
h = ones(1,31)/31;
y3 = conv(x,h);
y3(1:15) = [];
y3(end-14:end) = [];

figure(7)
plot(x), hold on
plot(y3), hold off
title('Plot of X and Y3')
xlabel('n')

%f
h = ones(1,67)/67;
y4 = conv(x,h);
y4(1:33) = [];
y4(end-32:end) = [];

figure(8)
plot(x), hold on
plot(y4), hold off
title('Plot of X and Y4')
xlabel('n')

%% 3: Difference Equations

%a
n = -5:5;
x1 = (n==2);
y1 = mydiffeq(x1);

x2 = (n==4);
y2 = mydiffeq(x2);
y3 = mydiffeq(x1+2*x2);
y5 = y1+2*y2;

figure(9)
subplot(3,2,1)
stem(n,x1)
title('x1')
xlabel('n')

subplot(3,2,2)
stem(n,x2)
title('x2')
xlabel('n')

subplot(3,2,3)
plot(n,y1)
title('y1')
xlabel('n')

subplot(3,2,4)
plot(n,y2)
title('y2')
xlabel('n')

subplot(3,2,5)
plot(n,y3)
title('y3')
xlabel('n')

subplot(3,2,6)
plot(n,y5)
title('y1+2*y2')
xlabel('n')

%b



%c
h1 = [1,zeros(1,100)];
y6 = mydiffeq(h1);
figure(10)
plot(y6)
title('Impulse Response of System')
xlabel('n')

%d
n = -5:60;
u1 = @(n) n>0;
u50 = @(n) n>50;
x = @(n) cos(pi*n / 8) .* (u1(n)-u50(n));
h = @(n) x(n)+2.*x(n-1)-0.95.*h(n-1); %not sure this is what h(n) should be
%y7 = conv(x(n),h(n));
y8 = mydiffeq(x(n));

figure(11)
subplot(1,2,1)
plot(y7)
title('h(n)')
xlabel('n')
subplot(1,2,2)
plot(y8)
title('Function Method')
xlabel('n')

%e
y9 = mydiffeq(h1);
y10 = newdiffeq(h1);

figure(12)
subplot(1,2,1)
plot(y9)
title('Uses mydiffeq')
xlabel('n')

subplot(1,2,2)
plot(y10)
title('Uses newdiffeq')
xlabel('n')

%f
figure(13)
y11 = anotherdiffeq(h1);
plot(y11)
title('Impulse response')
xlabel('n')