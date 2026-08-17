clc; 
clear;
close all;

%%
x=input('enter the sequence:');
p=input('enter the pointer position:');
s=input('enter the shifting factor:');
c=input('enter 1 for right shifting or 2 for left shifting:');

%%
l=length(x);
left=1-p;
right=l-p;
t=left:right;
subplot (1,2,1);
stem (t,x);
xlabel ('time');
ylabel ('amplitude');
title ('Original sequence');
grid on;

if(c==1)
    t=[left-s:right-s];
end
if(c==2)
    t=[left+s:right+s];
end
subplot (1,2,2);
stem (t,x);
xlabel ('time');
ylabel ('amplitude');
title ('Shifted sequence');
grid on;
