function mustBePositive(a)
    arguments
        a (1,1) double
    end
    if a < 0
        error('Must be positive.');
    end
end
