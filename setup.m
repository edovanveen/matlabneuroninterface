% Setup Neuron paths.
% Run this function once to set up your Matlab session for Neuron interaction.
function setup()

    % User setting:
    if ismac
        disp('Mac not Supported ... yet');
    elseif isunix
%         Here just check if it is in LD_LIBRARY_PATH, you can't set it on
%         runtime in matlab.
        NeuronInstallationDirectory = '/home/kian.ohara/.conda/envs/neuron/';
        % Check if NEURON directory is correct, look for nrniv executable
        filename = fullfile(NeuronInstallationDirectory, 'bin', 'nrniv');
%     
        assert(exist(filename, 'file') == 2, 'NeuronInstallationDirectory set in setup.m does not contain nrniv')
%         % All dependencies of the generated interface library must be findable.
%         % LINUX: Put them on the PATH
        dllpath = fullfile(NeuronInstallationDirectory, 'lib');
        syspath = getenv('LD_LIBRARY_PATH'); 
        % TODO: when at the end, does not have to have a pathsep. And a
        % filesep after the last directory is also optional. So that gives
        % multiple variants
        assert(contains(string(syspath), string(dllpath)), ...
            ... % TODO: improve this message
            'Linux needs to be started from a shell where the directory containing neuron nrniv.so is declared in the LD_LIBRARY_PATH');
    elseif ispc
        NeuronInstallationDirectory = 'C:\nrn';

        % Check if NEURON directory is correct.
        filename = fullfile(NeuronInstallationDirectory, 'bin', 'libnrniv.dll');
        
        assert(exist(filename, 'file') == 2, 'NEURON directory not found.');
        % All dependencies of the generated interface library must be findable.
        % WINDOWS: Put them on the PATH
        dllpath = fullfile(NeuronInstallationDirectory, 'bin');
        syspath = getenv('PATH'); 
        % TODO: when at the end, does not have to have a pathsep. And a
        % filesep after the last directory is also optional. So that gives
        % multiple variants
        if ~contains(string(syspath), string(dllpath)+pathsep)
            setenv('PATH', [dllpath pathsep syspath]);
        end
    else
        disp('This platform not supported ... yet');
    end

    % Path to the current directory.
    mlnrnpath = fileparts(mfilename('fullpath'));
    addpath(mlnrnpath);
    
    % Path to the generated interface library.
    addpath(fullfile(mlnrnpath, 'neuron'));
    
    % Path to example scripts.
    addpath(fullfile(mlnrnpath, 'examples'));

end
