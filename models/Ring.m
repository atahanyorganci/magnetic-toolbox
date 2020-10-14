classdef Ring
    properties
        Radius (1,1) double {mustBeRealFinite}
        Center (1,3) double {mustBeRealFinite}
    end
    
    properties (Access = private)
        Start (1,1) double {mustBeRealFinite}
        Stop (1,1) double {mustBeRealFinite}
    end
    
    properties (Constant)
        SampleCount = 1000;
    end
    
    properties (Dependent)
        Func
    end
    
    methods
        function r = Ring(radius, center, start, stop)
            arguments
                radius (1,1) double {mustBePositive} = 1;
                center (1,3) double = [0 0 0];
                start (1,1) double = 0;
                stop (1,1) double = 2*pi;
            end
            r.Radius = radius;
            r.Center = center;
            r.Start = start;
            r.Stop = stop;
        end

        function r = set.Radius(r,radius)
            r.Radius = radius;
        end

        function func = get.Func(r)
            [Cx, Cy, Cz] = createParametricCircle(r.Center, r.Radius);
            func = {Cx Cy Cz};
        end

        function disp(r)
            fprintf("Ring(radius=%0.2f, ", r.Radius);
            fprintf("center=(%0.2f,%0.2f,%0.2f))\n", ...
                r.Center(1), r.Center(2), r.Center(3));
        end

        function plot3(r, varargin)
            [x, y, z] = r.sample(r.Start,r.Stop,100);
            
            t = sprintf("Ring with radius of %0.2f centered at (%0.2f,%0.2f,%0.2f)", ...
                r.Radius, r.Center(1), r.Center(2), r.Center(3));
            plot3(x, y, z, varargin{:});
            grid on
            title(t)
            xlabel('x-axis')
            ylabel('y-axis')
        end

        function B_vec = observe(r,obs,sample_count)
            arguments
                r (1,1) Ring
                obs (1,3) double {mustBeRealFinite}
                sample_count (1, 1) double {mustBeRealFinite, ...
                    mustBeInteger, mustBePositive} = constants.sample_count
            end
            [x, y, z] = r.sample(r.Start,r.Stop,sample_count);
            B_vec = calculateMagneticField(x, y, z, obs);
        end
    end

    methods (Access=private)
        function [x, y, z] = sample(r,start,stop,sample_count)
            angles = linspace(start, stop, sample_count);
            circle = r.Func;
            x = circle{1}(angles);
            y = circle{2}(angles);
            z = circle{3}() * ones(1, sample_count);
        end
    end
end
