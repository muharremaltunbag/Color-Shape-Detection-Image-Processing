% Function to denoise the image
function [denoised_img] = denoise(image)
    filter=fspecial('average',5);
    denoised_img=imfilter(image,filter);
end
