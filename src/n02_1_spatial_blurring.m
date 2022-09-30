img = imread('img/butterfly.png');

% spatial blur image using 5x5 gaussian filter
blurred = conv_blur(img, 5, 'gaussian');
figure, imshow(blurred);

% spatial blur image using 7x7 gaussian filter
blurred = conv_blur(img, 7, 'gaussian');
figure, imshow(blurred);

% spatial blur image using 5x5 mean filter
blurred = conv_blur(img, 5, 'mean');
figure, imshow(blurred);

% spatial blur image using 7x7 mean filter
blurred = conv_blur(img, 7, 'mean');
figure, imshow(blurred);
