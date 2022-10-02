img = imread('img/fig_0222_b_cameraman.tif');
[sharpened, filtered] = freq_sharpen(img, 'ihpf', 50, nan);
figure, imshow(filtered);
figure, imshowpair(img, sharpened, 'montage');

img = imread('img/butterfly.png');
[sharpened, filtered] = freq_sharpen(img, 'ghpf', 0, nan);
figure, imshow(filtered);
figure, imshowpair(img, sharpened, 'montage');

img = imread('img/blurred_city.jpg');
[sharpened, filtered] = freq_sharpen(img, 'bhpf', 50, 2);
figure, imshow(filtered);
figure, imshowpair(img, sharpened, 'montage');
