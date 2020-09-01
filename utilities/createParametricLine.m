function [Lx, Ly, Lz] = createParametricLine(start, stop)
    arguments
        start (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        stop (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
    end
    t = sym('t');
    
    line = (stop - start) * t + start;
    Lx = matlabFunction(line(1));
    Ly = matlabFunction(line(2));
    Lz = matlabFunction(line(3));
end
