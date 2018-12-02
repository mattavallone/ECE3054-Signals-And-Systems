function y = mydiffeq( x )
N = length(x);
y = zeros(N,1);
y(1) = x(1);
    for n = 2:N
       y(n) = x(n) + 2*x(n-1) - 0.95*y(n-1);
    end
end

