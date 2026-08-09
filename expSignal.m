% program for exponential function
clc
clear all
close all
a=-0.05;
n=0:100;
for n1=1:101
    x(n1)=exp(a*(n1-1));
end
stem(n, x, 'filled');
xlabel('n');
ylabel('x(n)');
title('Unit Ramp Signal');
grid on;
