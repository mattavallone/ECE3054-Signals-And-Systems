%to run single part of code, highlight part of code and use F9
% help ______ is used to find info on a function
row_vector = [1, 2,3];
col_vector = [1;2;3];
ones(2,3) %matrix of all ones
zeros(3,2) %matrix of all zeros
another_vector = 1:6;

start = 1;
finish = 10;
hop = 2;
linearly_spaced_array = [start : hop : finish];
%used to make an array of a certain evenly spaced sized
LSA = linearly_spaced_array;
return_val = row_vector(2); %returns val at certain position in vector
%endVals = LSA(end-5 : end);

%% loops
for k = 1: -1: 23 %start at 1, down by 1 to -23
    disp(['k is now a string'; num2str(k)]);
end

total0 = 0;
for i = 1:length(a)
    total0 = total0 +a(i)
end
total = sum(a) %does same as loop above

total2 = sum(a(4:end)) %partial sum

%MATLAB INDEX STARTS AT 1 NOT 0

k = 0;
while k > -1
    k = k+1
    if k >  2300
        break
    end
end

k = 0;
while k < 5
    disp('k is less than 5')
    k = k +0.23
    pause(0.5) %pauses code for half sec
end

ben = 25;
awesome = 25;
 if ben == awesome
     disp('cool')
 else
     disp('oh well')
 end

 %USE CONTROL-C TO TERMINATE RUN
 
 ben = 20;
 awesome = 25
 if abs(ben - awesome) < 1e-5 % can be used to check if 2 items are equal
     disp('cool')
 elseif ~(ben == awesome) % ~ is not operator
     disp('huh')
 else 
     disp('oh well')
 end
 
%% functions
x = randn(4) %square matrix of random numbers with max of 4
y = randn(4, 2) %4x2 matrix
z = randi(2) %random integers
z1 = x.^2 + y.^2 % dot is used to tell Matlab to square each component of matrix

%anonymous function
f = @(a,b) a.^2 + y.^2 %creates a function handle f
z2 = f(x,y);



