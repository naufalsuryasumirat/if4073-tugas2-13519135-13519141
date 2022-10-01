%{
  Description: Function to remove noise using median filter
  Output: Noise-removed image using the median filter
  Input: Image matrix, kernel size of median filter
%}
function noise_free = noise_removal_median(mat, k_size)
    noise_free = mat;

    % guard if k_size is even, then add 1 to make it odd
    if ~(mod(k_size, 2)), k_size = abs(k_size) + 1; end

    % center of kernel size
    mc = double(idivide(k_size, int8(2)));

    % pad array with NaNs (Edge Handling: Constant), remove nan when finding median
    mat = padarray(mat, [double(mc) double(mc)], nan, 'both');
    [row, col, dim] = size(mat); % size of matrix after padding with NaNs

    for d=1:dim
        for i=mc+1:row-mc
            for j=mc+1:col-mc
                sliced = mat(i-mc:i+mc, j-mc:j+mc, d); % slice image with size of kernel
                sliced = sliced(:); % flatten array
                sliced = sliced(~isnan(sliced)); % remove nan
                noise_free(i-mc, j-mc, d) = uint8(median(sliced)); % replace with median of sliced
            end
        end
    end
end
