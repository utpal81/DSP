clc; 
clear; 
close all;

n = -30:30; % time vector
x = rectpuls (n ,20) ; % triangular pulse of width 20           
subplot (3 ,1 ,1)
stem(n ,x ,'r','linewidth',1); 
xlabel('time');
ylabel('amplitude');
title ('Triangular pulse');
grid on;

n1 = 2* n ; % new time vector scaled by 2
x1 = rectpuls (n1 ,20) ; % scaled triangular pulse
subplot (3 ,1 ,2)
stem(n ,x1 ,'b','linewidth',1);
xlabel('time');
ylabel('amplitude');
title ('Compressed Triangular pulse');
grid on;

n3 = 1/2* n; % new time vector scaled by 0.5
x3 = rectpuls (n3 ,20) ; % scaled triangular pulse
for n4=1:61
    n5=n4-61;
    if mod(n5,2) ~= 0
        x3(n4)=0;
    end
end    
subplot (3 ,1 ,3);
stem(n ,x3 ,'g','linewidth',1);
xlabel('time');
ylabel('amplitude');
title ('Expended Triangular pulse ');
grid on;

