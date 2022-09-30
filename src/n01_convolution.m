test_img = imread('../img/canoe.jpg');
% test_img = imread('../img/boat.bmp');
% test_img = imread('../img/lena_grayscale.tif');
% test_img = imread('../img/coin.png');

% mask = [1 2 1; 2 5 2; 1 2 1];
% mask = [0 -1 0; -1 4 -1; 0 -1 0];

blur = 13;

% gaussian filter


% mean filter
mask = ones(blur, blur);

disp(mask);

% actual
figure, imshow(test_img);

filtered = uint8(convn(double(test_img), double(mask/sum(test_mask(:)))));
figure, imshow(filtered);

test_img_conv = convolution(test_img, mask, false);
figure, imshow(test_img_conv);

figure, histogram(test_img_conv);

%{
  Description: 
  Output: 
  Input: 
%}
function convoluted = convolution(mat, mask, add)
    convoluted = mat;
    original = mat;
    mask = double(mask);
    [m_row, m_col, ~] = size(mask);

    % guard for if mask size is even or not symmetric
    if m_row ~= m_col || ~(mod(m_row, 2)), return; end

    % center of kernel/mask
    mc = double(uint8(m_row / 2) - 1);

    % pad array with 0s (Edge Handling: Constant)
    mat = padarray(mat, [double(mc) double(mc)], 0, 'both');
    [row, col, dim] = size(mat); % size of matrix after padding with 0s

    % if sum of all elements in mask is > 1, divide each el by sum
    mask_sum = sum(mask(:));
    if mask_sum > 1, mask = mask / mask_sum; end

    for d=1:dim
        for i=mc+1:row-mc
            for j=mc+1:col-mc
                % if  i > mc && i <= (row-mc) && j > mc && j <= (col-mc)
                sliced = double(mat(i-mc:i+mc, j-mc:j+mc, d));
                convoluted(i-mc, j-mc, d) = uint8(dot(sliced(:), mask(:)));
            end
        end
    end

    if add, convoluted = original + convoluted; end
end
