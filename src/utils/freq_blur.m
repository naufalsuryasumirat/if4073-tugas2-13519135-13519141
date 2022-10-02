%{
  Description: Blur image in frequency realm (lowpass filter)
  Output: Blurred image with specified LowPass Filter method and specified
    input parameters
  Input: Image matrix, blur options (ilpf || glpf || blpf), cutoff value,
    n value for Butterworth method
%}
function blurred = freq_blur(mat, blur_opt, cutoff, n)
    blurred = mat; % init return value same as input
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

    if isnan(cutoff) || ~cutoff, cutoff = 50; end % set default cutoff value if nan or 0
    if strcmp(blur_opt, 'ilpf') % ilpf (Ideal LowPass Filter)
        H = double(d <= abs(cutoff));
    elseif strcmp(blur_opt, 'glpf') % glpf (Gaussian LowPass Filter)
        H = exp(-(d .^ 2) ./ (2 * (abs(cutoff) ^ 2)));
    elseif strcmp(blur_opt, 'blpf') % blpf (Butterworth LowPass Filter)
        if isnan(n) || ~n, n = 1; end
        H = 1 ./ (1 + (d ./ abs(cutoff)) .^ (2 * abs(n)));
    else, return; % if LPF not specified, return input image
    end

    lpf = H .* f; % multiply f with H (element-wise)
    lpf = real(ifftn(lpf)); % inverse n-dimension fourier transform (from freq to spatial)
    blurred = lpf(1:row, 1:col, 1:dim); % cut off the padding to get blurred image
end
