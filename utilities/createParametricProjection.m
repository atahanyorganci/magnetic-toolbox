function [Px, Py, Pz] = createParametricProjection(start,R_cy,phi)
    arguments
        start (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        R_cy (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite}
        phi (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite}
    end
    t = sym('t');
    
    angle = start(2) + phi*t;
    along = angle * R_cy - start(1)*start(2);
    R_ci = phi*R_cy;

    x = R_cy * cos(angle);
    y = R_cy * sin(angle);
    z = start(3) + R_cy - R_cy * sqrt(1-(along/R_ci).^2);

    Px = matlabFunction(x);
    Py = matlabFunction(y);
    Pz = matlabFunction(z);
end
