# Magnetic Toolbox

Magnetic Toolbox is created to calculate magnetic field of various topologies by evaluating Biot-Savart using numerical methods.

## Requirements

MATLAB version should be at least 2019a as the source repository uses argument validation which are introduced in MATLAB 2019a, and Symbolic Toolbox.

- MATLAB version >= 2019a
- Symbolic Toolbox

## Using the Project

1. From `Home` tab in MATLAB click on `Open` (or hit `Ctrl+O`), then select `Magnetic_toolbox.prj` file located at the root of project.
   - `.prj` file is used to organize MATLAB source files, and prevent MATLAB path errors.
   - This file can also be used to interact with git repository
2. The repository comes with MATLAB live scripts (`*.mlx` files located under demo) that can used as a starting point.
3. All implemented functions have corresponding documentation along side them that explain what the function does, and how it does it.
   - Documentation can be viewed with either ``help <function name>` from command window, or opening it with code editor.

## Directory Organization

- **demo** contains live scripts that are used for demonstration purposes.
- **models** contains MATLAB classes for modeling various topologies.
- **resources** contains automatically generated MATLAB project files.
- **utilities** contains utility functions for creating function handles, and calculating magnetic field.
- **validators** contains functions that are used validating that function arguments are colinear points, have the same length, etc.

## Models

Every model implementation follows the same pattern where each model can instantiated with required parameters, and can be visualized in 3D space with `plot3`, and magnetic field at any point in space can be calculated with `observe(observation_point)`.
