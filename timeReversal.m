clc;
clear;
close all;

%%
x=input('enter the sequence:');
p=input('enter the pointer position:');

%%
l=length(x);
left=1-p;
right=l-p;
t=left:right;
subplot(1,2,1);
stem(t,x);
xlabel('Time');
ylabel('Amplitude');
title('Sequence');
grid on;

%%
y=flip(x);
t=-right:-left;
subplot(1,2,2);
stem(t,y);
xlabel('Time');
ylabel('Amplitude');
title('Folded sequence');
grid on;
