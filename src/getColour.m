% Function to determine the colour of a pixel
function [colour] = getColour(L, A, B, coord_1, coord_2)
    a = A(coord_1, coord_2);
    b = B(coord_1, coord_2);
    l = L(coord_1, coord_2);
    colornames = {'white','red','green','blue','yellow'};
    colorrefs = [1 1 1; 1 0 0; 0 1 0; 0 0 1; 1 1 0];
    color_diff = sqrt((colorrefs(:,1)-a).^2 + (colorrefs(:,2)-b).^2 + (colorrefs(:,3)-l).^2);
    [~, idx] = min(color_diff);
    colour = colornames{idx};
end
