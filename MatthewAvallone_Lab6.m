%% lab 6: Recursive Digital Filters

%Rp -> dp (how mucj the hump drops from one)
%Rs -> ds (how much the hump extends from zero)

%Don't need to worry about pole-zero diagram
%% 1

dp2rp = @(delP) -20*log10(1-delP);
ds2rs = @(delS) -20*log10(delS);

rp = dp2rp(0.01);
rs = ds2rs(0.01);

[b,a] = ellip(3,rp, rs, 0.4);
titleStr = ['Low Pass order- ', num2str(3), ' elliptic filter'];

makeLab6Plots(b,a,titleStr);

%% 2
[b,a] = ellip(4, rp, rs, 0.4);
titleStr = ['Low Pass order- ', num2str(4), ' elliptic filter'];

makeLab6Plots(b, a, titleStr);

%% 3
[b,a] = ellip(6, rp, rs, 0.4);
titleStr = ['Low Pass order- ', num2str(6), ' elliptic filter'];

makeLab6Plots(b, a, titleStr);

%% 4

[b,a] = ellip(3, rp, rs, 0.4, 'high');
titleStr = ['High Pass order- ', num2str(3), ' elliptic filter'];

makeLab6Plots(b,a,titleStr);

%% 5

[b,a] = ellip(5, rp, rs, [0.2,0.6]);
titleStr = ['BandPass order- ', num2str(5), ' elliptic filter'];

makeLab6Plots(b,a,titleStr);

%% 6

[b,a] = butter(4, 0.4);
titleStr = ['Low Pass order- ', num2str(4), ' Butterworth filter'];

makeLab6Plots(b,a,titleStr);

%% 7

rp = dp2rp(0.2);

[b,a] = cheby1(4, rp, 0.4);
titleStr = ['Low Pass order- ', num2str(4), ' chebyshrev1 filter'];

makeLab6Plots(b,a,titleStr);

%% 8

rp = dp2rp(0.3);

[b,a] = cheby2(4, rp, 0.4);
titleStr = ['Low Pass order- ', num2str(4), ' chebyshrev2 filter'];

makeLab6Plots(b,a,titleStr);
