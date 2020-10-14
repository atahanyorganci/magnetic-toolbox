function [B_vec] = ringB(a, rho, z)
    %ringB calculates magnetic field of a unit cirlce in space
    const = constants.mu_zero / 2 / pi;

    k = 4 * a * rho / ((a + rho) ^ 2 + z ^ 2);
    K = ellipticK(k);
    E = ellipticE(k);
    B_rho = const * z/(rho*sqrt((a+rho)^2+z^2)) ...
        * (-K + (a^2+rho^2+z^2)/((a-rho)^2+z^2)*E);
    B_phi = 0;
    B_z = const * 1/sqrt((a+rho)^2+z^2) ...
        * (K + (a^2-rho^2-z^2)/((a-rho)^2+z^2)*E);
    B_vec = [B_rho B_phi B_z];
end
