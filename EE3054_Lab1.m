%% 1
%a
A = [1 0 4 5 3 9 0 2];
a = [4 5 0 2 0 0 7 1];

%b
B = [A a]; %[] is concatenation operator
C = [a A];

%c
D = zeros(50);
E = ones(100);

%d
F = [1:30];
G = [25:-3:1];
H = [0:0.2:2]

%% 2
V1 = [1 2 3 4 5 6 7 8 9 0]
V2 = [0.3 1.2 0.5 2.1 0.1 0.4 3.6 4.2 1.7 0.9]
V3 = [4 4 4 4 3 3 2 2 2 1]

%a
s = sum(V1)+sum(V2)+sum(V3)

%b
disp(V2(5))
%errors occur for index values 0 and 11 since not in range

%v = 1:N

%% 4
%a
A = zeros(1,5);
for n = 1:4
    for m = 1:3
        A = A + n*m; %adding to A means all values are added with whatevers being added with A
        disp(A);
    end
end
disp(A)

%b
B = [1 0];
if (all(B))
B = B + 1;
elseif (any(B))
B = B + 2;
else
B = B + 3;
end
disp(B)

%d
for i = 1:20
H(i) = i * 5;
end
disp(H)
H = 1:20;
H = H*5;
disp(H)
