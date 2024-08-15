function [circleCoordinates] = findCircles(image_double)
    % Denoise the image
    image_dn = denoise(image_double);
    % Extract L channel
    L = image_dn(:,:,1);
    % Erode and dilate to enhance circles
    im1=imerode(L,ones(8));
    im2=imdilate(im1,ones(8));
    % Thresholding
    im3 = im2>40;
    % Find circles
    bw = imcomplement(im3);
    BW2 = bwareafilt(bw,5);
    s = regionprops(BW2,'centroid');
    centroids = cat(1,s.Centroid);
    % Plot detected circles
    imshow(BW2)
    hold on
    centre = centroids([1:2, 4:end], :); 
    plot(centre(:,1),centre(:,2),'b*');
    hold off
    % Return circle coordinates
    circleCoordinates = centroids([1:2, 4:end], :);
end
