function [Lx, Ly, Lz] = createParametricLine(start, stop)
    %createParametricLine straight line from start to stop
    %   [Lx, Ly, Lz] = createParametricLine(state, stop) produces
    %   function handles that can be used generate in Cartesian coordinates
    %   for a line that starts from start, and ends in stop. Parameter used
    %   't' maps 0 to start, and 1 to end of line. Lx, Ly, and Lz represent
    %   x,y,z coordinates in Cartesian system respectively.
    % Function uses symbolic toolbox to create the circle, then converts
    % resulting symbolic expression to MATLAB functions.
    arguments
        start (1, 3) double {mustBeNumeric, mustBeReal, mustBeFinite}
        stop (1, 3) double {mustBeNumeric, mustBeReal, mustBeFinite}
    end

    t = sym('t');

    line = (stop - start) * t + start;
    Lx = matlabFunction(line(1));
    Ly = matlabFunction(line(2));
    Lz = matlabFunction(line(3));
end
