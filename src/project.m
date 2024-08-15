%% FULL PIPELINE

% Specify the directory path and filename
directory = '/MATLAB Drive/matlab/images/images/';
filename = 'org_2.png';

% Load colour information from an image
colours = colourMatrix(directory, filename);
disp(colours)

% Load result data from a .mat file
data = load(fullfile(directory, 'org_2.mat')); % Use fullfile to construct full file path
res = data.res;

% Compute success rate comparing loaded results with detected colours
successRate = computeSuccessRate(res, colours);
fprintf('Success Rate: %.2f%%\n', successRate);

%%







    
