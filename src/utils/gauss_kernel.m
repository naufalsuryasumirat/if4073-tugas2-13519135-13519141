%{
  Description: Generate gaussian kernel for spatial blurring using gaussian filter
  Output: Kernel of size m x m with input sigma using the formula
    1/(2πσ²) * exp(-(x² + y² / 2σ²))
    *modified to make the center point the highest value
  Input: size of kernel (m), sigma input
%}
function kernel = gauss_kernel(m, sigma)
    kernel = zeros(m, m); % init kernel with zeros of size m x m

    c = double(idivide(m, int8(2))) + 1; % get the center point of the kernel matrix

    % apply modified formula
    for i=1:m
        for j=1:m
            kernel(i, j) = 1 / (2 * pi * sigma) * exp(-((i-c) ^ 2 + (j-c) ^ 2) / (2 * sigma ^ 2));
        end
    end

    kernel = kernel / sum(kernel(:)); % normalize kernel
end
