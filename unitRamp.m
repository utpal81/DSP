% Program for unit ramp
clear;
close all;
clc;

n = -50:50;
for n1=1:101
    if (n1>=51)    
      x(n1) = n1-51;
    else
      x(n1) = 0;  
    end
end    
stem(n, x, 'filled');
xlabel('n');
ylabel('x(n)');
title('Unit Ramp Signal');
grid on;
