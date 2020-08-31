function [B_vec] = calculateMagneticField(x, y, z, obs)
    arguments
        x (1,:) double {mustBeNumeric,mustBeReal,mustBeFinite}
        y (1,:) double {mustBeNumeric,mustBeReal,mustBeFinite,...
            mustBeSameLength(x,y)}
        z (1,:) double {mustBeNumeric,mustBeReal,mustBeFinite,...
            mustBeSameLength(x,z)}
        obs (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
    end
    dL_vec = [diff(x)' diff(y)' diff(z)'];
    S_vec = [x' y' z'];

    B_vec = zeros(1,3);
    for i=1:length(dL_vec)
        B_vec = B_vec + differentialB(S_vec(i,:),obs,dL_vec(i,:));
    end
end

