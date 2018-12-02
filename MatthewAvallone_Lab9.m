%% Lab 9

%% 1

%b
figure(1)
n = -10:10;
u = @(n) n > 0; 
h = @(n) (0.2.*0.5.^n).*u(n) + (1.2.*3.^n).*u(-n-1);
stem(n, h(n))
title('h[n]')
xlabel('n')

%c
b = [-1.5, 3.5, -1];
a = [1,0,0];
[r,p,k]  = residue(b,a);
C1 = r(1);
C2 = r(2);
p1 = p(1);
p2 = p(2);
R1 = abs(C1);
R2 = abs(C2);
alpha1 = angle(C1);
alpha2 = angle(C2);
r1 = abs(p1);
r2 = abs(p2);
beta1 = angle(p1);
beta2 = angle(p2);
%h(n) = r1*(p1)^n u(n) + r2*(p2)^n u(n) IF: |p1,2| <= 1 (a unit circle)
imp_response = r(1)*(p(1).^n).*(n>=0) + r(2)*(p(2).^n).*(n>=0);

figure(2)
stem(imp_response)
title('Impulse Response g(n)')
xlabel('n')

%% 2

%a 
b1 = [1,-1,0.7];
a1 = [1,-2.5,1];
[r,p,k]  = residue(b1,a1);
C1 = r(1);
C2 = r(2);
p1 = p(1);
p2 = p(2);
R1 = abs(C1);
R2 = abs(C2);
alpha1 = angle(C1);
alpha2 = angle(C2);
r1 = abs(p1);
r2 = abs(p2);
beta1 = angle(p1);
beta2 = angle(p2);
%h(n) = r1*(p1)^n u(n) + r2*(p2)^n u(n) IF: |p1,2| <= 1 (a unit circle)
imp_responseG = r(1)*(p(1).^n).*(n>=0) + r(2)*(p(2).^n).*(n>=0);

figure(3)
stem(imp_responseG)
title('Impulse Response g(n)')
xlabel('n')

%b
a2 = [1,-1,0.7];
b2 = [1,-2.5,1];
[r,p,k]  = residue(b2,a2);
C1 = r(1);
C2 = r(2);
p1 = p(1);
p2 = p(2);
R1 = abs(C1);
R2 = abs(C2);
alpha1 = angle(C1);
alpha2 = angle(C2);
r1 = abs(p1);
r2 = abs(p2);
beta1 = angle(p1);
beta2 = angle(p2);
%h(n) = r1*(p1)^n u(n) + r2*(p2)^n u(n) IF: |p1,2| <= 1 (a unit circle)
imp_responseH = r(1)*(p(1).^n).*(n>=0) + r(2)*(p(2).^n).*(n>=0);

figure(4)
subplot(1,3,1)
stem(imp_responseH)
title('Impulse Response h(n)')
xlabel('n')
subplot(1,3,2)
stem(imp_responseG)
title('Impulse Response g(n)')
xlabel('n')
subplot(1,3,3)
stem(conv(imp_responseH,imp_responseG))
title('h(n)*g(n)')
xlabel('n')

%c
[h1,w1] = freqz(b2,a2,n);
[h2,w2] = freqz(b1,a1,n);
[h3,w3] = freqz(conv(imp_responseH,imp_responseG), n);
figure(5)
subplot(1,3,1)
plot(w1,abs(h1))
title('Frequency Response of H')
xlabel('w')
subplot(1,3,2)
plot(w2, abs(h2))
title('Frequency Response of G')
xlabel('w')
subplot(1,3,3)
plot(w3, abs(h3))
title('Frequency Response of H*G')
xlabel('w')

%d

load DistortedSignal.txt

r = DistortedSignal;
figure(6)
subplot(1,2,1)
stem(r)
title('r(n)')
xlabel('n')
subplot(1,2,2)
stem(conv(r, imp_responseG))
title('Filtered r(n)')
xlabel('n')
