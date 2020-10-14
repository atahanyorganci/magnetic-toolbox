classdef Filament

    properties
        Start (1, 3) double {mustBeRealFinite}
        Stop (1, 3) double {mustBeRealFinite}
    end

    properties (Dependent)
        Func
    end

    methods

        function f = Filament(start, stop)
            f.Start = start;
            f.Stop = stop;
        end

        function func = get.Func(f)
            [Lx, Ly, Lz] = createParametricLine(f.Start, f.Stop);
            func = {Lx Ly Lz};
        end

        function disp(f)
            fprintf("Filament(");
            fprintf("start=(%0.2f,%0.2f,%0.2f) ", ...
                f.Start(1), f.Start(2), f.Start(3));
            fprintf("stop=(%0.2f,%0.2f,%0.2f))\n", ...
                f.Stop(1), f.Stop(2), f.Stop(3));
        end

        function plot3(f, varargin)
            [x, y, z] = f.sample(100);
            t = sprintf("Filament from (%0.2f,%0.2f,%0.2f) to (%0.2f,%0.2f,%0.2f)", ...
                f.Start(1), f.Start(2), f.Start(3), ...
                f.Stop(1), f.Stop(2), f.Stop(3));
            plot3(x, y, z, varargin{:});
            grid on
            title(t)
            xlabel('x-axis')
            ylabel('y-axis')
        end

        function B_vec = observe(f, obs, sample_count)

            arguments
                f (1, 1) Filament
                obs (1, 3) double {mustBeNumeric, mustBeReal, mustBeFinite}
                sample_count (1, 1) double {mustBeRealFinite, ...
                                            mustBeInteger, ...
                                            mustBePositive} = constants.sample_count
            end

            mustBeNonColinear(f.Start, f.Stop, obs);
            [x, y, z] = f.sample(sample_count);
            B_vec = calculateMagneticField(x, y, z, obs);
        end

    end

    methods (Access = private)

        function [x, y, z] = sample(f, sample_count)
            delta = f.Stop - f.Start;
            t = linspace(0, 1, sample_count);
            lines = f.Func;

            if (delta(1) == 0)
                x = zeros(1, sample_count);
            else
                x = lines{1}(t);
            end

            if (delta(2) == 0)
                y = zeros(1, sample_count);
            else
                y = lines{2}(t);
            end

            if (delta(3) == 0)
                z = zeros(1, sample_count);
            else
                z = lines{3}(t);
            end

        end

    end

end
