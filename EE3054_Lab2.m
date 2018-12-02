%% Making a signal
%%Create a vector and plot each value
N = 10000
n = 1:N
%Sinusoid
x = sin(n*2*pi*23/N) + sin(n*2*pi*2323/N) + sin(n*2*pi*(23^2)/N)
x = x./max(abs(x))

%%Attempt
figure(1) %%need number to specify which figure you're working with
plot(x)
title('ugly plot')

%%Attempt 2: Label
T = 23
%%sample_axis = 0:N-1
time_axis = 0:10 %%sameple_axis * (T/N)
figure(2)
plot(time_axis, x)
xlabel('Time')
ylabel('Amplitude')

%% closeall -clears figures

%%subplot(3,2,1) %%use to plot everything in one image; row, column, figure #
%%suptitle('yo') %%makes a title for the entire image of graphs

%% plot unit step functions
n = -10:10
unit_step_f = (n >= 0)
unit_step_f_4 = (n-4 >= 0)
u = @(n) (n>=0) %%I can use u as a function
figure(2, plot(n,u), ylim([-0.5,1.5]))
%% power of n
n = -10:10
a = 0.5
y = a.^n .* u(n)

figure(10)
stem(n,y)

%% convolution
f = u(n) - u(n-4)
g = n.*u(n)- 2*(n-4).*u(n-4)
fg = conv(f,g)
figure(3),stem(fg)