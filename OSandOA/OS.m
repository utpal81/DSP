clc;
clear;
close all;

%% Input sequences
x = input('Enter the input sequence x(n): ');
h = input('Enter the impulse response h(n): ');

Ls= length(x);
M = length(h);

L = input("Enter length of each block:");

N= L+M-1;

% Number of blocks
B = ceil(Ls/L);

Z = rem(Ls,M);
if Z
  x = [x zeros(1,L-Z)];
end  

% Pad input with zeros
x = [x zeros(1,M-1)];

% Pad impulse response
h = [h zeros(1,L-1)];



% Add M-1 zeros at the beginning
x = [zeros(1,M-1) x];

% Initialize output
y = [];

for k = 1:B

    % Extract block of N samples
    start = (k-1)*L + 1;
    block = x(start:start+N-1);

    % Circular convolution
    temp = cconv(block,h,N);

    % Discard first M-1 samples
    y = [y temp(M:N)];    
end

disp('Output y(n):');
disp(y);