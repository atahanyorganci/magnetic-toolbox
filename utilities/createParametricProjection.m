function [Px, Py, Pz] = createParametricProjection(R_cy,phi)
    arguments
        R_cy (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite}
        phi (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite}
    end
    t = sym('t');
    
    angle = phi*t;
    along = angle * R_cy;
    R_ci = phi*R_cy;

    x = R_cy * cos(angle);
    y = R_cy * sin(angle);
    z = R_cy - R_cy * sqrt(1-(along/R_ci).^2);

    Px = matlabFunction(x);
    Py = matlabFunction(y);
    Pz = matlabFunction(z);
end
