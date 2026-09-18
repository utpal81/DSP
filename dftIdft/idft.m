clc;
clear;
close all;

X = input('Enter the sequence: ');

N = length(X);

%% Initialize DFT and IDFT arrays

x = complex(zeros(1,N));

%% ---------------- IDFT ----------------
for n = 1:N
    for k = 1:N
        x(n) = x(n) + X(k) * exp(1j*2*pi*(k-1)*(n-1)/N);
    end

    x(n) = x(n)/N;

    idft_magnitude(n) = abs(x(n));
    idft_phase(n) = angle(x(n));
end

% ---------------- Plot IDFT ----------------
display(x);
disp('x=')
display(round(real(x)))

