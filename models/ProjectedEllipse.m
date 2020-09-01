classdef ProjectedEllipse
    properties
        Start (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
        CylinderRadius (1,1) double {mustBeNumeric,mustBeReal, ...
            mustBeFinite,mustBePositive}
        Angle (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite, ...
            mustBePositive}
    end
    
    properties (Dependent)
        CircleRadius (1,1) double {mustBeNumeric,mustBeReal,mustBeFinite, ...
            mustBePositive}
        Func
    end
    
    methods
        function p = ProjectedEllipse(start,radius,angle)
            p.Start = start;
            p.CylinderRadius = radius;
            p.Angle = angle;
        end

        function r = get.CircleRadius(p)
            r = p.CylinderRadius * p.Angle;
        end

        function func = get.Func(p)
            [x,y,z] = createParametricProjection(p.Start,p.CylinderRadius,p.Angle);
            func = {x,y,z};
        end

        function disp(p)
            fprintf("ProjectedEllipse(radius=%0.2f, angle=%0.2f)\n", ...
                p.CylinderRadius, p.Angle);
        end

        function plot3(p, varargin)
            [x, y, z] = p.sample(100);
            t = sprintf("ProjectedEllipse with radius %0.2f and angle of %0.2f radians", ...
                 p.CylinderRadius, p.Angle);
            plot3(x, y, z, varargin{:});
            grid on
            title(t)
            xlabel('x-axis')
            ylabel('y-axis')
        end
        

        function B_vec = observe(p,obs,sample_count)
            arguments
                p (1,1) ProjectedEllipse
                obs (1,3) double {mustBeNumeric,mustBeReal,mustBeFinite}
                sample_count (1,1) double {mustBeNumeric,mustBeReal, ...
                    mustBeFinite,mustBeInteger,mustBePositive} = p.SampleCount
            end
            [x, y, z] = p.sample(sample_count);
            B_vec = calculateMagneticField(x, y, z, obs);
        end
    end

    methods (Access=private)
        function [x, y, z] = sample(f,sample_count)
            t = linspace(0, 1, sample_count);
            curve = f.Func;
            x = curve{1}(t);
            y = curve{2}(t);
            z = curve{3}(t);
        end
    end
end

