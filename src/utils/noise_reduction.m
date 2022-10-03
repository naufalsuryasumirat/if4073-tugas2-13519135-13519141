%{
  Description: Function to reduce noice
  Output: fixed image
  Input: image with noise
%}

function newimg = noise_reduction(img,type)
    noise = img;
    [rows, cols, rgb] = size(img);

    if (rgb>1)
        grayscale = rgb_to_grayscale(img);
        img = grayscale;
    end

    imgf = fftshift(fftn(im2double(img)));
    figure; imagesc(log1p(abs(imgf))), colormap gray;

    if type == 'lena1'
        indexes = [
            22 123 26 127;
            209 103 212 107;
            124 123 128 127;
            104 103 108 107;
            1 105 110 105;
            120 105 231 105;
            1 125 103 125;
            120 125 231 125;
            106 205 106 212;
            106 2 106 4;
            126 226 126 228;
            126 18 126 25;
        ];

        for i=1:size(indexes,1)
            range = indexes(i,:);
            imgf(range(1):range(3),range(2):range(4)) = 0;
        end

    end

    figure; imagesc(log1p(abs(imgf))), colormap gray;
    
    newimg = im2uint8(real(ifftn(ifftshift(imgf)))); % inverse n-dimension fourier transform (from freq to spatial)

end

