%% Lab 3

%% 
%1 need n <=0
%2 Matlab only takes indices >= 1

%this means y(0) will be an error
%create an initial condition for y(1) and start at n = 2
%assume y(0) and x(0) are zero because of 2

%Go from 2:N in for loop

%% Write function file

% function output = function_name(input)

%1 initialize
%2 do a for-loop with difference eqn

%input is a whole signal
%output is a whole NEW signal filtered by the difference eqn
% end

%make multiple function files to make life easier
%% Time invariance

% y(t-T) = S(x(t-T))
% Can be tested by created 2 signals and shifting one and seeing if output
% is shifted

%% Impluse response

%put a delta function through the system to find impluse response

