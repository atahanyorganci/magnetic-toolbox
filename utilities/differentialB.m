function [dB] = differentialB(source, obs, dL, current)
    %differentialB calculates differntial magnetic field from differential
    % length, source, and observation points acording to Biot-Savart Law.
    arguments
        source (1, 3) double {mustBeRealFinite}
        obs (1, 3) double {mustBeRealFinite}
        dL (1, 3) double {mustBeRealFinite}
        current (1, 1) double {mustBeRealFinite} = 1.0
    end

    const = constants.mu_zero / (4 * pi);

    % Biot-Savart Law
    R_vec = obs - source;
    R = sqrt(R_vec(1)^2 + R_vec(2)^2 + R_vec(3)^2);
    X_vec = cross(dL, R_vec);
    dB = const * current * X_vec / R^3;
end
