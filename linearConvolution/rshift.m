function y = rshift(x,d)
    y = [zeros(1,d), x(1:end-d)];
end

