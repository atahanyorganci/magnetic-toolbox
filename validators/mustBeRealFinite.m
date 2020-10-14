function mustBeRealFinite(a)
    %mustBeRealFinite Validate that input is finite real numeric value.
    %   mustBeRealFinite(a) is combination of mustBeNumeric, mustBeReal,
    %   and mustBeFinite.
    % mustBeNumeric, mustBeReal, and mustBeFinite are widely used in the
    % repository, and this function is created to reduce verbosity.
    mustBeNumeric(a);
    mustBeReal(a);
    mustBeFinite(a);
end
