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
    % figure; imagesc(log1p(abs(imgf))), colormap gray;

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
    elseif strcmp(type,'lena2')
        indexes = [
            1 122 106 122;
            148 122 247 122;
            155 1 157 102;
            171 1 173 83;
            185 1 189 60;
            204 1 204 43;
            219 27 222 27;
            91 144 93 243;
            75 165 77 243;
            60 185 60 243;
            44 201 44 243;
            108 136 108 140;
            1 106 247 106;
            1 138 247 138;
            1 169 247 170;
            1 184 247 186;
            1 201 247 201;
            1 217 247 217;
            1 27 247 27;
            1 43 247 43;
            1 58 247 60;
            1 74 247 76;
            245 1 247 3;
            139 105 141 107;
            123 1 125 58;
            123 186 125 243;
            58 183 64 187;
        ];

        for i=1:size(indexes,1)
            range = indexes(i,:);
            imgf(range(1):range(3),range(2):range(4)) = 0;
        end

        i = 247;
        j = 1;
        while (i>3 &j<240)
            if ((i<100 | i>150) & (j<100 | j>150))
                imgf(i-3:i,j:j+3) = 0;            
            end
                i = i-3;
                j = j+3;
        end
    elseif strcmp(type,'building')
        indexes = [
            1 159 100 161;
            140 159 237 161;
            1 258 237 262;
            1 58 237 62;
            % 119 1 119 130;
            % 119 200 119 318;
        ];

        for i=1:size(indexes,1)
            range = indexes(i,:);
            imgf(range(1):range(3),range(2):range(4)) = 0;
        end
    end

    % figure; imagesc(log1p(abs(imgf))), colormap gray;
    
    newimg = im2uint8(real(ifftn(ifftshift(imgf)))); % inverse n-dimension fourier transform (from freq to spatial)

end

