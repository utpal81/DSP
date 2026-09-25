clc
clear
close all

x = input('Enter the first sequence: ');
y = input('Enter the second sequence: ');

N = length(x);
t = 0:N-1;

% Generate circulant matrix
S(1,:) = x;

for n = 2:N
    S(n,:) = circshift(S(n-1,:),1);
end

% Circular convolution
res = S' * y(:);

subplot(3,1,1)
stem(t,x)
title('First sequence')
xlabel('n')
ylabel('x[n]')

subplot(3,1,2)
stem(t,y)
title('Second sequence')
xlabel('n')
ylabel('y[n]')

subplot(3,1,3)
stem(t,res)
title('Circular convolution')
xlabel('n')
ylabel('y[n]')

disp('Circulant Matrix:')
disp(S)

disp('Circular Convolution:')
disp(res)