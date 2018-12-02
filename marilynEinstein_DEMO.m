%% (0) Import Data
%Ben Cowen
% Signals and Systems homemade lab
%Last Edit: 4/20/2017

% LOAD IMAGES:
M= double(rgb2gray(imread('actual_marilyn.jpg')));
E= double(rgb2gray(imread('actual_einstein.jpg')));
[m,n]=size(M);

cm = round(m/2);
cn = round(n/2);
%% (0.5) View the images

figure(1)
subplot(1,3,1)
imagesc(M)
title('Marilyn')
axis image off
colormap gray

subplot(1,3,2)
imagesc(E)
title('Alby')
axis image off
colormap gray

subplot(1,3,3)
imagesc(M+E)
title('Marilyn+Alby')
axis image off
colormap gray

%% (1) Filter Marilyn
% Look at 2D frequency spectrum:
FM = fftshift(fft2(M));
freq_ax = -pi : pi/m : pi*(1-1/m);

figure(2)
subplot(1,3,1)
imagesc(freq_ax,freq_ax,20*log10(abs(FM)))
colormap gray
colorbar
title('2D dB Frequency Spectrum')

% Make a binary mask:
lowmask = zeros(m,n);
nn1 = 50;          
lowmask(cm-nn1:cm+nn1, cn-nn1:cn+nn1) = 1; %cm,cn defined in lines 11-12
subplot(1,3,2)
imagesc(lowmask)
title('white = 1; black = 0')

% Apply Mask to Marilyn
fm = lowmask.*FM;
MM = abs(ifft2(fftshift(fm)));
subplot(1,3,3)
imagesc(MM)
title('Result')
axis off
colormap gray

%% (2) What is this...?
L = fftshift(ifft2( lowmask ));
figure(10)
imagesc(abs(L))
colorbar
title('What is this?')

%% (3) Filter Einstein
% Look at 2D frequency spectrum:
FE = fftshift(fft2(E));

figure(3)
subplot(1,3,1)
imagesc(freq_ax,freq_ax,20*log10(abs(FE)))
colormap gray
colorbar
title('2D dB Frequency Spectrum')
% axis square off

% Make a binary mask:
highmask = ones(m,n);
nn2 = 50;
highmask(cm-nn2:cm+nn2, cn-nn2:cn+nn2) = 0;
subplot(1,3,2)
imagesc(highmask)
title('white = 1; black = 0')
% axis square off


% Apply Mask to Einstein
fe = highmask.*FE;
EE = abs(ifft2(fftshift(fe)));
subplot(1,3,3)
imagesc(EE)
title('Result')
axis off
colormap gray

suptitle('Try playing with "nn1", the diameter of the box')
%% (4)Add the images together.

new = MM+EE;
figure(10000)
imagesc(new)
colormap gray

image_name = ['Marilyn Einsten, nn1 = ',num2str(nn1),', nn2 = ',num2str(nn2)];
title(image_name)

print('-dpdf', image_name)


