img = imread('img/boat.bmp');
blurred = freq_blur(img, 'ilpf', 50, nan);
figure, imshowpair(img, blurred, 'montage');

img = imread('img/butterfly.png');
blurred = freq_blur(img, 'glpf', 50, nan);
figure, imshowpair(img, blurred, 'montage');

img = imread('img/canoe.jpg');
blurred = freq_blur(img, 'blpf', 50, 3);
figure, imshowpair(img, blurred, 'montage');
