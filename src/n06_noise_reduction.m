img = imread('img/lenanoise.png');
newimg = noise_reduction(img, 'lena1');
figure, imshowpair(img, newimg, 'montage');

img = imread('img/scientificnoise.png');
newimg = noise_reduction(img, 'science');
figure, imshowpair(img, newimg, 'montage');