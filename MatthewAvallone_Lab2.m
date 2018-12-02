%% 1: Plotting Continuous-Time Signals
figure(1)
subplot(1,3,1)
t = 0:2*pi; plot(t,sin(t))
subplot(1,3,2)
t = 0:0.2:2*pi; plot(t,sin(t))
subplot(1,3,3)
t = 0:0.02:2*pi; plot(t,sin(t))
title('My Favorite Function')
xlabel('t (Seconds)')
ylabel('y(t)')

axis([0 2*pi -1.2 1.2])

t = 0:0.2:2*pi; plot(t,sin(t),t,sin(2*t))

t = 0:0.2:2*pi; plot(t,sin(t),'.')

t = 0:0.2:2*pi; plot(t,sin(t),t,sin(t),'r.')

%% 2: Plotting Discrete-Time Signals
figure(2)
n = -10:10; 
f = n >= 0;
stem(n,f);
title('f')

u = @(n) double (n >= 0); %unit step function
d = @(n) double (n == 0); %unit delta function
f = @(n) u(n) - u(n-4);
g = @(n) n.*u(n) - (2*(n-4)).*u(n-4) + (n-8).*u(n-8);
x = @(n) d(n) - 2.*d(n-4);
a = 0.9;
y = @(n) a.^n .* (u(n) - u(n-20));
v = @(n) cos(0.12*pi*n) .* u(n);

n = -1:0.5:10;
figure(3)
subplot(3,2,1)
stem(n,f(n))
title('f(n)')
subplot(3,2,2)
stem(n,g(n))
title('g(n)')
subplot(3,2,3)
stem(n,x(n))
title('x(n)')

n = -1:0.5:20;
subplot(3,2,4)
stem(n,y(n))
title('y(n)')
subplot(3,2,5)
stem(n,v(n))
title('v(n)')


%% 3: conv Command

u = @(k) double(k >= 0); %unit step function
d = @(k) double(k == 0); %unit delta function

f = @(k) u(k) - u(k-4);
g = @(k) k.*u(k) - 2*(k-4).*u(k-4) + (k-8).*u(k-8);

figure(6)
k = 0:8;
k1 = 0:6;
subplot(2,1,1)
stem(f(k1));
title('f(n)')
xlabel('n')
subplot(2,1,2)
stem(g(k));
title('g(n)')
xlabel('n')

a = conv(f(k1),f(k1));
b = conv(a,f(k1));
c = conv(f(k1),g(k));
k2 = 0;
D = conv(g(k),d(k2));
e = conv(g(k),g(k));

figure(4)

subplot(3,2,1)
stem(a)
title('a')
xlabel('n')
ylabel('f(n)*f(n)')
axis([0 8 0 5])

subplot(3,2,2)
stem(b)
title('b')
xlabel('n')
ylabel('f(n)*f(n)*f(n)')
axis([0 11 0 12])

subplot(3,2,3)
stem(c)
title('c')
xlabel('n')
ylabel('f(n)*g(n)')
axis([0 12 0 13])

subplot(3,2,4)
stem(D)
title('d')
xlabel('n')
ylabel('g(n)*d(n)')
axis([0 10 0 4])

subplot(3,2,5)
stem(e)
title('e')
xlabel('n')
ylabel('g(n)*g(n)')
axis([2 16 0 45])
%% 4: Plotting a Sample-Signal
figure(5)
t = [0;0.3;0.6;0.9;1.2;1.5;1.8;2.1;2.4;2.7;3;3.3];
data = [6;-1.3;-8;-11.7;-11;-6;1.3;8;11.7;11;6;-1.3];
f = fit(t,data,'smoothingspline');
plot(f, t, data)
xlabel('TIME (SECONDS)')
ylabel('x(t)')
title('This is a Sample Signal')    

