img = imread('img/mancave.png');
brightened = freq_brightening(img,4);
figure, imshowpair(img, histeq(brightened), 'montage');

img = imread('img/fruitmaybe.png');
brightened = freq_brightening(img,2.8);
figure, imshowpair(img, brightened, 'montage');