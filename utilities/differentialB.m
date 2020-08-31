function [dB] = differentialB(source,obs,dL,current)
    arguments
        source (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        obs (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        dL (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        current (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite} = 1.0
    end
    const = constants.mu_zero / (4 * pi);
    
    % Biot-Savart Law
    R_vec = obs - source;
    R = sqrt(R_vec(1)^2 + R_vec(2)^2 + R_vec(3)^2);
    X_vec = cross(dL, R_vec);
    dB = const * current * X_vec / R^3;
end
