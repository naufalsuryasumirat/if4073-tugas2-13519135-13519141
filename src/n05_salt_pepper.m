img = imread('img/fig_0241_c_einstein_high_contrast.tif');
img = imread('img/butterfly.png');

img = imnoise(img, 'salt & pepper', 0.05);

[~, ~, dim] = size(img);

if dim == 1
    k = medfilt2(img);
    figure, imshowpair(img, k, 'montage');
else
    k = medfilt3(img);
    figure, imshowpair(img, k, 'montage');
end

K = noise_removal_median(img, 3);
figure, imshowpair(img, K, 'montage');