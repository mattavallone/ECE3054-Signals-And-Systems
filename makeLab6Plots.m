function [] = makeLab6Plots(b,a,titleString)

% dB anonymous function
dB = @(x) 20*log10(abs(x));
imp_rsp = filter(b,a,[1,zeros(1,19)]);
[H,om]  = freqz(b,a);

figure()

% Impulse Response
subplot(2,2,1)
stem(imp_rsp)
title('Impulse Response')

% Frequency Response (linear)
subplot(2,2,2)
plot(om,abs(H))
xlabel('Frequency')
title('Freq. Resp. (linear)')

% Frequency Response (dB)
subplot(2,2,3)
plot(om,dB(H))
xlabel('Frequency')
title('Freq. Resp. (dB)')


% Pole-Zero Diagram
subplot(2,2,4)
zplane(b,a)
title('Pole-Zero Diagram')

suptitle(titleString)
end