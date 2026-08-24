% Program for unit step
clear;
close all;
clc;

n = -10:50;
for n1=1:61
    if (n1>=11)    
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
