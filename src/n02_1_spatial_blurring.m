img = imread('img/butterfly.png');

% spatial blur image using 5x5 gaussian filter, sigma = 1.6
blurred = conv_blur(img, 5, 'gaussian', 1.6);
figure, imshow(blurred);

% spatial blur image using 7x7 gaussian filter, sigma = 1.6
blurred = conv_blur(img, 7, 'gaussian', 1.6);
figure, imshow(blurred);

% spatial blur image using 5x5 mean filter
blurred = conv_blur(img, 5, 'mean', nan);
figure, imshow(blurred);

% spatial blur image using 7x7 mean filter
blurred = conv_blur(img, 7, 'mean', nan);
figure, imshow(blurred);
