function [colour_matrix] = colourMatrix(directory, filename)
    % Construct the full path to the image
    full_path = fullfile(directory, filename);
    % Load and convert image to LAB color space
    image_db = loadImage(full_path);
    % Detect circles in the image
    circle_centres = findCircles(image_db);
    % Correct image distortion using detected circle centers
    corrected = correctImage(directory, circle_centres, image_db);
    % Find colours in the corrected image
    colour_matrix = findColours(directory, corrected);
end
