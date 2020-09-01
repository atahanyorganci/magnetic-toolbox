function mustBeNonColinear(a, b, c)
    arguments
        a (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        b (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        c (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
    end
    if abs(a-b) == abs(a-c) + abs(c-b)
        error('Points must not be colinear.');
    end
    if abs(b-c) == abs(b-a) + abs(a-c)
        error('Points must not be colinear.');
    end
    if abs(c-a) == abs(c-b) + abs(b-a)
        error('Points must not be colinear.');
    end
end
