test_img = imread('../img/canoe.jpg');
% test_img = imread('../img/boat.bmp');
% test_img = imread('../img/lena_grayscale.tif');
% test_img = imread('../img/coin.png');

% ctest_img = conv2(test_img(:,:,1), [1 2 1; 2 5 2; 1 2 1]);
% figure, imshow(test_img);
% figure, imshow(ctest_img);

test_mat = [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20; 21 22 23 24 25];
% test_mask = [1 2 1; 2 5 2; 1 2 1];
% test_mask = [0 -1 0; -1 4 -1; 0 -1 0];
test_mask = [1 1 1; 1 1 1; 1 1 1];

% testing
% test_conv = convn(test_mat, test_mask/sum(test_mask(:)), 'same');
% disp(test_conv);

% test_func = convolution(test_mat, test_mask, false);
% disp(test_func);

% test_convn = convn(test_img, test_mask/sum(test_mask(:)), 'same');
% disp(int8(test_convn));

% disp('testingtesting\n\n\n');

% test_conv = convolution(test_img, test_mask, false);
% disp(test_conv);

% figure, imshow(test_conv);
% figure, imshow(uint8(test_convn));

% actual
figure, imshow(test_img);

filtered = uint8(convn(double(test_img), double(test_mask/sum(test_mask(:)))));
figure, imshow(filtered);
disp(test_mask);

test_img_conv = convolution(test_img, test_mask, false);
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
