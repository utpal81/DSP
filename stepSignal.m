% Program for unit step
clear;
close all;
clc;

n = -50:50;
for n1=1:101
    if (n1>=51)    
      x(n1) = 1;
    else
      x(n1) = 0;  
    end
end    
stem(n, x, 'filled');
xlabel('n');
ylabel('x(n)');
title('Unit Step Signal');
grid on;
