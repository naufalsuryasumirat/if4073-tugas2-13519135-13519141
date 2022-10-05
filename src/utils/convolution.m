%{
  Description: Function to perform convolution on matrix with mask/kernel
  Output: Convoluted image using mask/kernel
  Input: Matrix of image, Convolution Mask/Kernel, option to add the convoluted image with base image 
%}
function convoluted = convolution(mat, mask, add)
    convoluted = mat;
    original = mat;
    mask = double(mask);
    [m_row, m_col, ~] = size(mask);

    % guard for if mask size is even or not symmetric
    if m_row ~= m_col || ~(mod(m_row, 2)), return; end

    % center of kernel/mask
    mc = double(idivide(m_row, int8(2)));

    % pad array with 0s (Edge Handling: Constant)
    mat = padarray(mat, [mc mc], 0, 'both');
    [row, col, dim] = size(mat); % size of matrix after padding with 0s

    % if sum of all elements in mask is > 1, divide each el by sum
    mask_sum = sum(mask(:));
    if mask_sum > 1, mask = mask / mask_sum; end

    for d=1:dim
        for i=mc+1:row-mc
            for j=mc+1:col-mc
                sliced = double(mat(i-mc:i+mc, j-mc:j+mc, d));
                convoluted(i-mc, j-mc, d) = uint8(dot(sliced(:), mask(:)));
            end
        end
    end

    if add, convoluted = original + convoluted; end
end
