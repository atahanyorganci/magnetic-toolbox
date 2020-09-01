function [Cx,Cy,Cz] = cylindricalToCartesian(rho, phi, z)
    arguments
        rho (1,:) double {mustBeNumeric,mustBeReal,mustBeFinite}
        phi (1,:) double {mustBeNumeric,mustBeReal,mustBeFinite, ...
            mustBeSameLength(rho,phi)}
        z (1,:) double {mustBeNumeric,mustBeReal,mustBeFinite, ...
            mustBeSameLength(phi,z)}
    end
    Cx = rho .* cos(phi);
    Cy = rho .* sin(phi);
    Cz = z;
end