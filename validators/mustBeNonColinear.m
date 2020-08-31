function mustBeNonColinear(a, b, c)
    arguments
        a (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        b (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        c (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
    end
    if dist(a,b) == dist(a,c) + dist(b,c)
        error('Points must not be colinear.');
    end
end
