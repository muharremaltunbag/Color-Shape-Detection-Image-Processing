
% Function to compute the success rate
function successRate = computeSuccessRate(res, colours)
    res_lower_trimmed = strtrim(lower(res));
    colours_lower_trimmed = strtrim(lower(colours));
    num_matches = 0;
    % Compare results and detected colours
    for i = 1:numel(res_lower_trimmed)
        if strcmp(res_lower_trimmed{i}, colours_lower_trimmed{i})
            num_matches = num_matches+ 1;
        end
    end
    % Compute success rate
    successRate = (num_matches / numel(res_lower_trimmed)) * 100;
end
