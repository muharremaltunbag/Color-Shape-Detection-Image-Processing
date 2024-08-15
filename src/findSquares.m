% Function to find square centres in the image
function [square_centres] = findSquares(filename) 
    rgb = imread(filename);
    image_dn = denoise(rgb);
    % Convert image to binary
    BW = imbinarize(rgb);
    % Remove small objects
    BW = bwareaopen(BW, 1000);
    % Dilate the image
    BW = imdilate(BW, ones(10));
    % Invert binary image
    bw_inv = ~BW;
    % Find connected components
    CC = bwconncomp(bw_inv);
    centroids = regionprops(CC, 'Centroid');
    % Extract square centres
    square_centres = cat(1, centroids.Centroid);
end
