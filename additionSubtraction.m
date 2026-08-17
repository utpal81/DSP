clc;
clear;
close all;

%%
x=input('enter the 1st sequence:');
y=input('enter the 2nd sequence:');

%%
subplot(4,1,1);
stem(x);
xlabel('time');
ylabel('amplitude');
title('1st sequence');
grid on;

subplot(4,1,2);
stem(y);
xlabel('time');
ylabel('amplitude');
title('2nd sequence');
grid on;

%%
z=x+y;
subplot(4,1,3);
stem(z);
xlabel('time');
ylabel('amplitude');
title('Addition of two signals');
grid on;

w=x-y;
subplot(4,1,4);
stem(w);
xlabel('time');
ylabel('amplitude');
title('subtraction of two signals');
grid on;