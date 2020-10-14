function [B_vec] = calculateMagneticField(x, y, z, obs)
    %calculateMagneticField calculates B from source points, and
    %observation point
    %   [B_vec] = calculateMagneticField(x,y,z,obs) calculates magnetic
    %   field by first taking calculating the difference (approximate
    %   derivative) of source points, then calculates aggragate sum of
    %   differential magnetic fields.
    arguments
        x (1, :) double {mustBeRealFinite}
        y (1, :) double {mustBeRealFinite, mustBeSameLength(x, y)}
        z (1, :) double {mustBeRealFinite, mustBeSameLength(x, z)}
        obs (1, 3) double {mustBeRealFinite}
    end

    dL_vec = [diff(x)' diff(y)' diff(z)'];
    S_vec = [x' y' z'];

    B_vec = zeros(1, 3);

    for i = 1:length(dL_vec)
        B_vec = B_vec + differentialB(S_vec(i, :), obs, dL_vec(i, :));
    end

end
