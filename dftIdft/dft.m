clc;
clear;
close all;

x = input('Enter the sequence: ');

N = length(x);

% Initialize DFT arrays
X = complex(zeros(1,N));


% ---------------- DFT ----------------
for k = 1:N
    for n = 1:N
        X(k) = X(k) + x(n) * exp(-1j*2*pi*(k-1)*(n-1)/N);
    end

    magnitude(k) = abs(X(k));
    phase(k) = angle(X(k));
end

% ---------------- Display and Plot DFT ----------------
display(X)

subplot(3,1,1);
stem(0:N-1, x);
xlabel('k');
ylabel('Magnitude');
title('DFT Magnitude Response');
grid on;

subplot(3,1,2);
stem(0:N-1, magnitude);
xlabel('k');
ylabel('Magnitude');
title('DFT Magnitude Response');
grid on;

subplot(3,1,3);
stem(0:N-1, phase);
xlabel('k');
ylabel('Phase (rad)');
title('DFT Phase Response');
grid on;

