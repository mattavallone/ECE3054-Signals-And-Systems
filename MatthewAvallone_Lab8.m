%% Lab 8

N = 100;
K = 0.98;

b = [1];
a = [1,zeros(1,100),0.5*K,0.5*K];

Fs = 8000;
L = Fs-N;
x = [randn(1,N) zeros(1,L)];
y = filter(b,a,x);
soundsc(y);
figure(1)
plot(y)

title('Simulated Plucked String Signal')

[H,w] = freqz(b,a,2^16);
figure(2)
plot(w/pi*Fs/2,abs(H))
xlabel('frequency')
title('Frequency Response')

%% Changing K

N = 100;
K = 0.5;

b = [1];
a = [1,zeros(1,100),0.5*K,0.5*K];

Fs = 8000;
L = Fs-N;
x = [1 zeros(1,L)];
y = filter(b,a,x);
soundsc(y,Fs);
figure(1)
plot(y)

title('Simulated Plucked String Signal')

[H,w] = freqz(b,a,2^16);
figure(2)
plot(w/pi*Fs/2,abs(H))
xlabel('frequency')
title('Frequency Response')

%% Changing N

N = 200;
K = 0.98;

b = [1];
a = [1,zeros(1,100),0.5*K,0.5*K];

Fs = 8000;
L = Fs-N;
x = [1 zeros(1,L)];
y = filter(b,a,x);
soundsc(y,Fs);
figure(1)
plot(y)

title('Simulated Plucked String Signal')

[H,w] = freqz(b,a,2^16);
figure(2)
plot(w/pi*Fs/2,abs(H))
xlabel('frequency')
title('Frequency Response')

%% Changing x

N = 100;
K = 0.5;

b = [1];
a = [1,zeros(1,100),0.5*K,0.5*K];

Fs = 8000;
L = Fs-N;
x = [randn(1,N) zeros(1,L)];
y = filter(b,a,x);
soundsc(y,Fs);
figure(1)
plot(y)

title('Simulated Plucked String Signal')

[H,w] = freqz(b,a,2^16);
figure(2)
plot(w/pi*Fs/2,abs(H))
xlabel('frequency')
title('Frequency Response')

%% Fundamental Freq

Fs = 8000;
d = 0.5;
N = 100;
L = Fs-N;
K = 0.5;

b = [1];
a = [1,zeros(1,100),0.5*K,0.5*K];

Fo = Fs / (N+d);

x = [1, zeros(1,L)];
y = filter(b,a,x);
soundsc(y,Fs);
figure(1)
plot(y)

title('Simulated Plucked String Signal')

%% Comb Filter

N = 100;
K = 0.98;

b = [1];
a = [1,zeros(1,N),0.5*K];

Fs = 8000;
L = Fs-N;
x = [randn(1,N) zeros(1,L)];
y = filter(b,a,x);
soundsc(y);
figure(1)
plot(y)

title('Simulated Plucked String Signal')

[H,w] = freqz(b,a,2^16);
figure(2)
plot(w/pi*Fs/2,abs(H))
xlabel('frequency')
title('Frequency Response')
