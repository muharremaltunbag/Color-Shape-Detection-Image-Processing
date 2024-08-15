function [image_doub] = loadImage(filename) 
    rgb = imread(filename);
    C = makecform('srgb2lab');
    lab = applycform(rgb, C);
    image_doub = lab2double(lab);
end
