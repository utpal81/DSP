% Program to generate a sine wave
clear;
close all;
clc;

n = 0:0.01:100;      % Discrete-time index
f = 5;               % Frequency in cycles/sample

x = cos(2*pi*f*n);

plot(n(1:100), x(1:100));
xlabel('n');
ylabel('x(n)');
title('Discrete-Time Sine Wave');
grid on;