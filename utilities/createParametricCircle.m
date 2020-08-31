function [Cx, Cy, Cz] = createParametricCircle(center, radius)
    arguments
        center (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        radius (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite}
    end
    t = sym('t');
    
    circle = center + [radius * cos(t) radius * sin(t) 0];
    Cx = matlabFunction(circle(1));
    Cy = matlabFunction(circle(2));
    Cz = matlabFunction(circle(3));
end
