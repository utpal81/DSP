% 8-point FFT using the radix-2 DIT algorithm

N = 8;
numStages = 3;

x = input('Enter the sequence x(n) = ');

% Rearrange the input into bit-reversed order.
x1 = bitrevorder(x);

% Store the bit-reversed input and the result of each stage.
stages = zeros(N, numStages + 1);
stages(:, 1) = x1.';

% Perform the three radix-2 butterfly stages.
for stage = 1:numStages
    groupSize = 2^stage;
    halfSize = groupSize / 2;
    next = zeros(1, N);

    for first = 1:groupSize:N
        for k = 0:halfSize-1
            upper = x1(first + k);
            lower = x1(first + k + halfSize);

            twiddle = exp(-2*pi*1i*k/groupSize);
            product = twiddle * lower;

            next(first + k) = upper + product;
            next(first + k + halfSize) = upper - product;
        end
    end

    x1 = next;
    stages(:, stage + 1) = x1.';
end

% The final FFT output.
X = x1;

fprintf('8-point FFT output X(k):\n');
disp(X);

fprintf('Stage values (columns: bit-reversed input, then stages 1 to 3):\n');
disp(stages);