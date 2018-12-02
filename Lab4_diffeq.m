function [ y ] = Lab4_diffeq( x )
N = length(x);
y = zeros(1,N);
     
y(1) = x(1);
y(2) = x(2) - 2.5*x(1) + y(1) - 0.0 ;  % y(2-2)=y(0) = 0
for n = 3:N
    y(n) = x(n) - 2.5*x(n-1) +y(n-1) -0.7*y(n-2) ;
end


%IGNORE THE LAST TERM TO MAKE IT EQUAL TO 'FILTER' !!
% y(N+1) = 0 - 2.5*x(N) + y(N) -0.7*y(N-1);
end


