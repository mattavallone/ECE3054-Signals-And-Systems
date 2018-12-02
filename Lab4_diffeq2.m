function [ y ] = Lab4_diffeq2( x )
N = length(x);
y = zeros(1,N);
     
y(1) = x(1);
y(2) = x(2) - 0.6*x(1) + 2.1*y(1);  
y(3) = x(3) - 0.6*x(2) +2.1*y(2) - 1.6*y(1);
    for n = 4:N
        y(n) = x(n) - 0.6.*x(n-1) + 2.1.*y(n-1) -1.6.*y(n-2) +0.4.*y(n-3);
    end

end


