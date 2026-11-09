% 8-point FFT using the radix-2 DIT algorithm

clc;
clear;
close all;

x = input('Enter the sequence x(n) = ');

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
W4 = [1, -1i];

for first = 1:4:8
    upper1 = x2(first);
    lower1 = x2(first + 2) .* W4(1);

    upper2 = x2(first+1);
    lower2 = x2(first + 3) .* W4(2);

    x3(first)     = upper1 + lower1;
    x3(first + 2) = upper1 - lower1;
    x3(first+1)   = upper2 + lower2;
    x3(first + 3) = upper2 - lower2;
end

disp('After stage 2:');
disp(x3);

%% Stage 3: one group of 8

W8 = exp(-2*pi*1i*(0:3)/8);
upper1b = x3(1);
upper2b = x3(2);
upper3b = x3(3);
upper4b = x3(4);
lower1b = x3(5) .* W8(1);
lower2b = x3(6) .* W8(2);
lower3b = x3(7) .* W8(3);
lower4b = x3(8) .* W8(4);

X(1) = upper1b + lower1b;
X(2) = upper2b + lower2b;
X(3) = upper3b + lower3b;
X(4) = upper4b + lower4b;

X(5) = upper1b - lower1b;
X(6) = upper2b - lower2b;
X(7) = upper3b - lower3b;
X(8) = upper4b - lower4b;

disp('8-point FFT output X(k):');
disp(X);