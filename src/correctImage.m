function [corrected] = correctImage(directory, circleCoordinates, image)
    I = loadImage(fullfile(directory, 'org_2.png'));
    standard_centroids = findCircles(I);
    standard_centres = im2double(standard_centroids);
    current_centroids = findCircles(image);
    current_centres = im2double(current_centroids);
    tform = fitgeotrans(current_centres,standard_centres,'projective');
    corrected = imwarp(image,tform,'OutputView',imref2d(size(I)));
    % Display corrected image
    figure(10), imshow(corrected); 
end
