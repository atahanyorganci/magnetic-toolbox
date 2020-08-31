function mustBeSameLength(a, b)
    arguments
        a (1,:)
        b (1,:)
    end
    if length(a) ~= length(b)
        error('Vectors must be same length.');
    end
end
