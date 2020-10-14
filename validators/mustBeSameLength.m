function mustBeSameLength(a, b)
    % mustBeSameLength Validates that input vectors have same length
    %   mustBeSameLength(a,b) throws an error when vectors are not the same length
    % Vectors supplied must be one dimensional of any type.
    arguments
        a (1, :)
        b (1, :)
    end

    if length(a) ~= length(b)
        error('Vectors must be same length.');
    end

end
