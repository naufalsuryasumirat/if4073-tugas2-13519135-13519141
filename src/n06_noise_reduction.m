% img = imread('img/lenanoise.png');
% newimg = noise_reduction(img, 'lena1');
% figure, imshowpair(img, newimg, 'montage');

% img = imread('img/scientificnoise.png');
% newimg = noise_reduction(img, 'science');
% figure, imshowpair(img, newimg, 'montage');

% img = imread('img/lenanoise1.png');
% newimg = noise_reduction(img, 'lena2');
% figure, imshowpair(img, newimg, 'montage');

img = imread('img/building.png');
newimg = noise_reduction(img, 'building');
figure, imshowpair(img, newimg, 'montage');