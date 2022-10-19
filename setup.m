% Run this file once to set up your Matlab session for Neuron interaction.

% User setting:
NeuronInstallationDirectory = 'C:\nrn';

% Check if NEURON directory is correct.
filename = fullfile(NeuronInstallationDirectory, 'bin', 'libnrniv.dll');
assert(exist(filename, 'file') == 2, 'NEURON directory not found.');

% All dependencies of the generated interface library must be findable.
% WINDOWS: Put them on the PATH
dllpath = fullfile(NeuronInstallationDirectory, 'bin');
mlpath = fullfile(matlabroot, 'extern', 'bin', 'win64');
syspath = getenv('PATH'); 
setenv('PATH', [dllpath pathsep mlpath pathsep syspath]);

% Create definition file for NEURON library.
HeaderFilePath = "bin/nrnmatlab.h";
StaticLibPath = "bin/libnrniv.a";
LibMexPath = fullfile(matlabroot, "extern", "lib", "win64", "mingw64", "libmex.lib"); % For mexPrintf
HdPath = fullfile(matlabroot, "extern", "include");
clibgen.generateLibraryDefinition(HeaderFilePath, ...
    Libraries=[StaticLibPath, LibMexPath], ...
    OverwriteExistingDefinitionFiles=true, ...
    IncludePath=HdPath,...
    PackageName="neuron");

% Path to the generated interface library.
addpath neuron;

% Build the library interface.
build(defineneuron);
