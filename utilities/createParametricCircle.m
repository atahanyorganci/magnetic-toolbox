function [Cx, Cy, Cz] = createParametricCircle(center, radius)
    %createParametricCircle circle with desired center point, and raidus
    %   [Cx, Cy, Cz] = createParametricCircle(center, radius) produces
    %   function handles that can be used sample a circle in Cartesian
    %   coordinates for a circle with specified radius, and center point
    %   parametrized by positive angle in radians. Cx, Cy, and Cz represent
    %   x,y,z coordinates in Cartesian system respectively.
    % Function uses symbolic toolbox to create the circle, then converts
    % resulting symbolic expression to MATLAB functions.
    arguments
        center (1, 3) double {mustBeRealFinite}
        radius (1, 1) double {mustBeRealFinite}
    end

    t = sym('t');

    circle = center + [radius * cos(t) radius * sin(t) 0];
    Cx = matlabFunction(circle(1));
    Cy = matlabFunction(circle(2));
    Cz = matlabFunction(circle(3));
end
