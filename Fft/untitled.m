% 8-point FFT using the radix-2 DIT algorithm

clc;
clear;
close all;

x = input('Enter the sequence x(n) = ');

if ~isnumeric(x) || isempty(x) || ~isvector(x)
    error('Input must be a nonempty numeric vector.');
end

if numel(x) > 8
    error('Enter no more than 8 input values.');
end

% Convert to a row vector and pad with zeros to length 8.
x = double(x(:).');
x = [x, zeros(1, 8 - numel(x))];

% Rearrange the input into bit-reversed order.
x1 = bitrevorder(x);
disp('Bit-reversed input:');
disp(x1);

%% Stage 1: groups of 2

x2 = zeros(1, 8);

for first = 1:2:8
    upper = x1(first);
    lower = x1(first + 1);

    x2(first)     = upper + lower;
    x2(first + 1) = upper - lower;
end

disp('After stage 1:');
disp(x2);

%% Stage 2: groups of 4

x3 = zeros(1, 8);
twiddle4 = [1, -1i];

for first = 1:4:8
    upper = x2(first:first + 1);
    lower = x2(first + 2:first + 3) .* twiddle4;

    x3(first:first + 1)     = upper + lower;
    x3(first + 2:first + 3) = upper - lower;
end

disp('After stage 2:');
disp(x3);

%% Stage 3: one group of 8

twiddle8 = exp(-2*pi*1i*(0:3)/8);
upper = x3(1:4);
lower = x3(5:8) .* twiddle8;

X = [upper + lower, upper - lower];

disp('8-point FFT output X(k):');
disp(X);