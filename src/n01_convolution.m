img = imread('img/canoe.jpg');

blur = 13;

% mean filter
mask = ones(blur, blur);

disp(mask);

% actual
figure, imshow(img);

% convolution using built-in matlab function
filtered = uint8(convn(double(img), double(mask/sum(mask(:)))));
figure, imshow(filtered);

% convolution using self-made function
img_conv = convolution(img, mask, false);
figure, imshow(img_conv);

% show histogram of convoluted image
figure, histogram(img_conv);
