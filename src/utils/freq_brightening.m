%{
  Description: Function to brighten image by frequency domain altering using high boost filter concept
  Output: brightened image
  Input: original image
%}
function brightened = freq_brightening(img, intensity)
    brightened = img;
    [rows, cols, rgb] = size(img);

    blurimg = freq_blur(img, 'blpf', 50, 1);
    [p, q] = deal(rows * 2, cols * 2); % assigning p and q for padding purposes
    imgpad = padarray(im2double(img), [rows cols], 0, 'post'); % padding matrix
    imgf = fftn(imgpad);

    [p, q] = deal(rows * 2, cols * 2); % assigning p and q for padding purposes
    blurimgpad = padarray(im2double(blurimg), [rows cols], 0, 'post'); % padding matrix
    blurimgf = fftn(blurimgpad);

    % high boost filter
    newimgf = (intensity.*imgf) - blurimgf;
    newimg = real(ifftn(newimgf)); % inverse n-dimension fourier transform (from freq to spatial)
    brightened = im2uint8(newimg(1:rows, 1:cols, 1:rgb)); % cut off the padding to get blurred image
end

