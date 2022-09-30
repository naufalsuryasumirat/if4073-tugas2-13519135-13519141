
%{
  Description: 
  Output: 
  Input: 
%}
% opt == 'gaussian', opt == 'mean' filters
function blurred = conv_blur(mat, m_size, filt_opt)
    blurred = mat;
    if ~mod(m_size), m_size = m_size + 1; end

    mask = zeros(m_size, m_size);

    if filt_opt == 'gaussian'
        % mask = generate_gaussian;
    elseif filt_opt == 'mean'
        mask = mask + 1;
    else
        return;
    end

    blurred = convolution(mat, mask, false);
end
