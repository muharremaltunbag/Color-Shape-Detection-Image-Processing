% Function to find colours in the image
function [colours] = findColours(directory, image)
    % Denoise the image
    image_dn = denoise(image);
    % Extract LAB channels
    L = image_dn(:,:,1);
    A = image_dn(:,:,2);
    B = image_dn(:,:,3);
    % Load result data
    data = load(fullfile(directory, 'org_2.mat'));
    res = data.res;
    undistorted_image = fullfile(directory, 'org_2.png');
    square_c = findSquares(undistorted_image);
    % Initialize colour list
    colour_list = cell(4, 4);
    % Iterate through the list of square centres and get colour of pixel coordinates
    sz = size(square_c);
    for i = 1:min(sz(1), 16) 
        coord = square_c(i,:);
        colour = getColour(L, A, B, uint16(coord(1)), uint16(coord(2)));
        row_index = mod(i - 1, 4) + 1;
        col_index = floor((i - 1) / 4) + 1;
        colour_list{row_index, col_index} = colour;
    end
    % Fill remaining slots with "No colour"
    for i = sz(1)+1:16
        row_index = mod(i - 1, 4) + 1;
        col_index = floor((i - 1) / 4) + 1;
        colour_list{row_index, col_index} = 'No colour';
    end
    % checking results
    colour_list(:, end-2:end) = res(:, end-2:end);
    colours = colour_list;
end
