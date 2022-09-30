%{
  Description: 
  Output: 
  Input: 
%}
% opt == 'gaussian', opt == 'mean' filters
function blurred = conv_blur(mat, m_size, filt_opt)
    blurred = mat;
    if ~mod(m_size, 2), m_size = m_size + 1; end

    mask = zeros(m_size, m_size);

    if strcmp(filt_opt, 'gaussian')
        mask = fspecial(filt_opt, [m_size m_size], 1.6);
    elseif strcmp(filt_opt, 'mean')
        mask = mask + 1;
    else
        return;
    end

    blurred = convolution(mat, mask, false);
end
