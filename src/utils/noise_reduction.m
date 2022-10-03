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

    if strcmp(type,'lena1')
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
    elseif strcmp(type,'science')
        indexes = [
            1 320 345 324;
            1 440 345 460;
            540 320 881 324;
            540 440 881 460;
            441 1 441 320;
            441 579 441 881;
            1 577 345 579;
            540 577 881 579;
            335 126 350 126;
            335 191 350 192;
            335 256 350 258;
            335 780 350 780;
            335 697 350 697;
            335 713 350 715;
            335 843 350 846;
            335 649 350 650;
        ];

        for i=1:size(indexes,1)
            range = indexes(i,:);
            imgf(range(1):range(3),range(2):range(4)) = 0;
        end
    end

    figure; imagesc(log1p(abs(imgf))), colormap gray;
    
    newimg = im2uint8(real(ifftn(ifftshift(imgf)))); % inverse n-dimension fourier transform (from freq to spatial)

end

