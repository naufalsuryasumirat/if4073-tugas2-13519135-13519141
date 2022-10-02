%{
  Description: Sharpen iamge in frequency realm (highpass filter)
  Output: Sharpened image with specified HighPass Filter method and specified
    input parameters
  Input: Image matrix, sharpen options (ihpf || ghpf || bhpf), cutoff value,
    n value for Butterworth method
%}
function [sharpened, filtered] = freq_sharpen(mat, shrp_opt, cutoff, n)
    sharpened = mat; % init return value same as input
    original = mat; % original matrix values
    [row, col, dim] = size(mat);

    [p, q] = deal(row * 2, col * 2); % assigning p and q for padding purposes
    mat = padarray(im2double(mat), [row col], 0, 'post'); % padding matrix

    f = fftn(mat); % fast n-dimension fourier transform of image matrix input
    
    [u, v] = deal(0:(p-1), 0:(q-1)); % assign range of variables
    [idx, idy] = deal(find(u > p/2), find(v > q/2)); % get indices to use in meshgrid
    
    u(idx) = u(idx) - p;
    v(idy) = v(idy) - q;

    % get meshgrid arrays
    [mv, mu] = meshgrid(v, u);
    d = sqrt(mu .^ 2 + mv .^ 2);
    
    if isnan(cutoff) || ~cutoff, cutoff = p / 20; end % default cutoff variable
    if strcmp(shrp_opt, 'ihpf') % ihpf (Ideal HighPass Filter)
        H = double(d <= cutoff);
    elseif strcmp(shrp_opt, 'ghpf') % ghpf (Gaussian HighPass Filter)
        H = exp(-(d .^ 2) ./ (2 * (cutoff ^ 2)));
    elseif strcmp(shrp_opt, 'bhpf') % bhpf (Butterworth HighPass Filter)
        if isnan(n) || ~n, n = 1; end
        H = 1 ./ (1 + (d ./ cutoff) .^ (2 * abs(n)));
    else, return; % if LPF not specified, return input image
    end

    H = 1 - H; % high pass is 1 - low pass
    hpf = H .* f; % multiply f with 1-H (element-wise), 1-H to sharpen image
    hpf = real(ifftn(hpf)); % inverse n-dimension fourier transform (from freq to spatial)
    % convert filtered (double) to filtered (uint8)
    filtered = im2uint8(hpf(1:row, 1:col, 1:dim)); % cut off the padding to get sharpened image
    sharpened = original + filtered; % sharpened image is original + filtered
end
