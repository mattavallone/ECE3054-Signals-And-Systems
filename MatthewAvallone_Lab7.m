%%Lab 7
load mtlb;
load NoisySpeech.txt;

L = length(mtlb);
Fs = 7418;
plot([1:L]/Fs,mtlb)
axis tight
title('mtlb')
xlabel('TIME (SECONDS)')

%% 1

x = NoisySpeech;
figure(1)
plot([1:L]/Fs,x)
axis tight
title('Noisy Signal')
xlabel('TIME (SECONDS)')

%% 2

[M,f] = dtft(mtlb,1/Fs);
figure(2)
plot(f,M)
xlabel('FREQUENCY (Hz)')
title('SPECTRUM of MTLB')

%% 3

[M,f] = dtft(x,1/Fs);
figure(3)
plot(f,M)
xlabel('FREQUENCY (Hz)')
title('SPECTRUM of Noisy Signal')

%% 4

dp2rp = @(delP) -20*log10(1-delP);
ds2rs = @(delS) -20*log10(delS);

rp = dp2rp(0.01);
rs = ds2rs(0.01);

[b,a] = ellip(5,rp, rs, 0.1);
lessNoisy = filter(b,a,x);
figure(4)
subplot(3,2,1)
plot([1:L]/Fs, lessNoisy)
xlabel('TIME (SECONDS)')
title('Filtered Noisy Signal 1')
[M,f] = dtft(lessNoisy,1/Fs);
subplot(3,2,2)
plot(f,M)
xlabel('FREQUENCY (Hz)')
title('SPECTRUM of Filtered Noisy Signal 1')


rp = dp2rp(0.01);
rs = ds2rs(0.01);
[b,a] = ellip(5,rp, rs, 0.3);
lessNoisy = filter(b,a,x);
subplot(3,2,3)
plot([1:L]/Fs, lessNoisy)
xlabel('TIME (SECONDS)')
title('Filtered Noisy Signal 2')
[M,f] = dtft(lessNoisy,1/Fs);
subplot(3,2,4)
plot(f,M)
xlabel('FREQUENCY (Hz)')
title('SPECTRUM of Filtered Noisy Signal 2')

rp = dp2rp(0.01);
rs = ds2rs(0.3);
[b,a] = ellip(3,rp, rs, 0.6);
lessNoisy = filter(b,a,x);
subplot(3,2,5)
plot([1:L]/Fs, lessNoisy)
xlabel('TIME (SECONDS)')
title('Filtered Noisy Signal 3')
[M,f] = dtft(lessNoisy,1/Fs);
subplot(3,2,6)
plot(f,M)
xlabel('FREQUENCY (Hz)')
title('SPECTRUM of Filtered Noisy Signal 3')


% dB = @(m) 20*log10(abs(m));
% [H,om]  = freqz(b,a);
% 
% figure(5)
% plot(om,dB(H))
% xlabel('Frequency (dB)')
% title('Filtered Signal')
