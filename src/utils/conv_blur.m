%{
  Description: Blur image using convolution method, with two filter options ('mean', and 'gaussian')
  Output: Blurred image through convolution
  Input: Matrix image, size of kernel/mask, filter option ('mean', or 'gaussian')
%}
% opt == 'gaussian', opt == 'mean' filters
function blurred = conv_blur(mat, m_size, filt_opt)
    blurred = mat;
    if ~mod(m_size, 2), m_size = abs(m_size) + 1; end % if even-sized kernel, add 1 to make it odd

    mask = zeros(m_size, m_size); % init mask to be used for convolution

    if strcmp(filt_opt, 'gaussian')
        mask = gauss_kernel(m_size, 1.6); % generate gaussian kernel using sigma of 1.6
    elseif strcmp(filt_opt, 'mean')
        mask = mask + 1; % add 1 to make it mean filter
    else
        return;
    end

    blurred = convolution(mat, mask, false);
end
