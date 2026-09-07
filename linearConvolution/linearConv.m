clc;
clear;
close all;
%% Input sequences and find length

x = input('Enter x(n): ');
h = input('Enter h(n): ');

lenx = length(x);
lenh = length(h);

%% Fold h(n)
hf = fliplr(h);

%% Zero padding
hf = [hf zeros(1,lenx-1)];
xpad = [zeros(1,lenh-1) x];

%% Linear convolution Logic for each sample of y
for i = 1:lenx+lenh-1
    hf_shift = rshift(hf,i-1);    % shift hf 
    v=xpad .* hf_shift;           % multiply shifted hf and xpad
    y(i) = sum(v);                % sum all samples of v
end

%% Display Results
disp('Linear convolution y(n) = ');
disp(y);

%% Plot
subplot(3,1,1);
stem(0:lenx-1,x,'filled');
title('x(n)');
xlabel('n');
ylabel('Amplitude');

subplot(3,1,2);
stem(0:lenh-1,h,'filled');
title('h(n)');
xlabel('n');
ylabel('Amplitude');

subplot(3,1,3);
stem(0:lenx+lenh-2,y,'filled');
title('y(n) = x(n) * h(n)');
xlabel('n');
ylabel('Amplitude');