function [Cx, Cy, Cz] = cylindricalToCartesian(rho, phi, z)
    %cylindricalToCartesian converts Cylindrical coordinates to Cartesian.
    arguments
        rho (1, :) double {mustBeRealFinite}
        phi (1, :) double {mustBeRealFinite, mustBeSameLength(rho, phi)}
        z (1, :) double {mustBeRealFinite, mustBeSameLength(phi, z)}
    end

    Cx = rho .* cos(phi);
    Cy = rho .* sin(phi);
    Cz = z;
end
