%% Lab 4

%z-transform --> value at n = coefficient of z; n value = neg. power of z
%example: 2d(n)+d(n-1)-d(n-2)-->2z^(0)+z^(-1)-z^(-2)

%H(z) = summation [h(n)z^(-n)]
%Z(x(n)) = X(z)
%Z(x(n-k)) = z^(-k)*X(z) --> This shows that it is time invariant

%How to find difference equation
% Y = H*X --> H = Y/X
%summation[a(k)*y(n-k)] = summation[b(k)*x(n-k)]
% ^ == summation[ a(k)* z^(-k)*Y(z) ] = summation[ b(k)* z^(-k)*X(z) ]
% ^ == Y(z)*(summation[a(k)*z^(-k)]) = X(z)*(summation[b(k)*z^(-k)])
% Y(z)/X(z) == Y/X = summation[ b(k)*z^(-k) ] / summation[ a(k)*z^(-k) ]

%% From Lab

%(1)
%H(z) = [some b values / some a values] --> (b0 = 1, b1 = 2.5; 
                                            %a0 = 1, a1= -1,a2 = 0.7;)                                                

%make delta function and imput it below
%use diff eq with for loop
%use filter()
%to check for if they're the same, stem both on same figure

% To bring Z transform back to time domain, use inverse Z transform
% break up a Z function into partial fractions
% H(z)/z = 1/ f(z) = r1/(z-p1) + r2/(z-p2)
% == r1*(p1)^n u(n) + r2*(p2)^n u(n) IF: |p1,2| <= 1 (a unit circle)
% so summation[ |hk| ] < infinity (it converges)

%% 1

impulse = [1,zeros(1,24)];         
n   = 0 : 24;                  
% Using Difference Equation
imp_response1 = Lab4_diffeq(impulse);
figure(1)
subplot(2,2,1)
stem(n, imp_response1)
title('Impulse Response using Lab4 diffeq')
xlabel('n')

% Using filter()
b = [1,-2.5];
a = [1,-1,0.7];
imp_response2 = filter(b,a,impulse);
subplot(2,2,2)
stem(n, imp_response2)
title('Impulse Response using filter()')
xlabel('n')

% Is there a difference?
subplot(2,2,3)
stem(n, imp_response1 - imp_response2)
title('Difference between the two methods')
xlabel('n')

%% 2

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
imp_response3 = r(1)*(p(1).^n).*(n>=0) + r(2)*(p(2).^n).*(n>=0);

figure(2)
subplot(1,2,1)
stem(n,imp_response3)
title('Impulse Response using Residues')
xlabel('n')

subplot(1,2,2)
stem(n, abs(imp_response3 - imp_response2)> 1e-14)
title('Difference with previous method')
xlabel('n')

%% 3

c1 = R1 .* exp(1i*alpha1);
c2 = R2 .* exp(1i*alpha2);
P1 = r1 .* exp(1i*beta1);
P2 = r2 .* exp(1i*beta2);

%imp_response4 = c1 * P1 + c2 * P2;

%No complex nums
imp_response4 = 2.*R1.*(r1.^n).*cos(beta1.*n + alpha1) .* (n>=0);

figure(3)
subplot(1,2,1)
stem(n,imp_response4)
title('Impulse Response using Polar Coordinates')
xlabel('n')

subplot(1,2,2)
stem(n, abs(imp_response4 - imp_response3)> 1e-14)
title('Difference with previous method')
xlabel('n')

%% 4
h1 = filter(b,a,impulse);

figure(4)
subplot(1,2,1)
stem(h1)
title('Impulse Response using filter')
xlabel('n')
subplot(1,2,2)
zplane(b,a)
title('circles = zeros, X-s = poles')

%% 5

%Repeating steps 1-4 in the following figure
impulse = [1,zeros(1,24)];         
n   = 0 : 24;  
figure(5)

imp_response1 = Lab4_diffeq2(impulse);
subplot(3,2,1)
stem(n, imp_response1)
title('Impulse Response using Lab4 diffeq2')
xlabel('n')

b = [1,-0.6];
a = [1,-2.1,1.6,-0.4];
imp_response2 = filter(b,a,impulse);
subplot(3,2,2)
stem(n, imp_response2)
title('Impulse Response using filter()')
xlabel('n')

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
imp_response3 = r(1)*(p(1).^n).*(n>=0) + r(2)*(p(2).^n).*(n>=0);
subplot(3,2,3)
stem(n,imp_response3)
title('Impulse Response using Residues')
xlabel('n')

c1 = R1 .* exp(1i*alpha1);
c2 = R2 .* exp(1i*alpha2);
P1 = r1 .* exp(1i*beta1);
P2 = r2 .* exp(1i*beta2);
imp_response4 = 2.*R1.*(r1.^n).*cos(beta1.*n + alpha1) .* (n>=0);
subplot(3,2,4)
stem(n,imp_response4)
title('Impulse Response using Polar Coordinates')
xlabel('n')

subplot(3,2,5)
zplane(b,a)
title('circles = zeros, X-s = poles')