% Source code dari tugas 1 sebelumnya (13519135 dan 13519029)

%{
  Description: implementation of rgb values to grayscale values
  Output: 2D matrix of size row(matrix), col(matrix), with grayscale
    values using the formula 0.2989 * Red + 0.5870 * Green + 0.1140 * Blue
  Input: 2D Matrix of n dimension n > 0
%}
function grayscale = rgb_to_grayscale(matrix)
  [~, ~, dim] = size(matrix);
  % if image is already in grayscale values
  if dim == 1, grayscale = matrix; return, end

  grayscale = matrix(:,:,1) * 0.2989 + matrix(:,:,2) * 0.587 + matrix(:,:,3) * 0.114;
  grayscale = uint8(grayscale);
end

%{
  Description: Calculates occurences of each pixel value for a given matrix
  Output: Vector with 256 columns with values [0,255] of occurences
  Input: 2D pixel matrix
%}
function occ = calc_occurences(matrix)
  occ = zeros(1,256);
  [row, col] = size(matrix);
  for r = 1:row
    for c = 1:col
      occ(matrix(r,c)+1) = occ(matrix(r,c)+1) + 1;
    end
  end
end

%{
  Description: Plots occurences of pixel using stem function
  Output: Stem of pixel occurences
  Input: Vector with 256 columns of pixel occurences
%}
function occurences_to_plot(occ)
  occ(occ==0) = nan; % converts 0 to nan, to not show in stem plot
  figure, stem(0:255, occ, 'MarkerSize', 0.1);
  xlim([0 255]); % limit x value to in range of [0, 255]
end

%{
  Description: Plots stem of image rgb and/or grayscale values, with option to show images
  Output: Figures of plots and images
  Input: image matrix (grayscale/colored)
%}
function img_plot(img, show_img, show_split)
  [~, ~, dim] = size(img);
  % if image is already in grayscale
  if dim == 1, occurences_to_plot(calc_occurences(img)); return, end

  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  gr = rgb_to_grayscale(img);
  occurences_to_plot(calc_occurences(r))
  occurences_to_plot(calc_occurences(g))
  occurences_to_plot(calc_occurences(b))
  occurences_to_plot(calc_occurences(gr))

  if show_img
    figure, imshow(img); % show original image
  end

  if show_split
    red = img;
    red(:,:,2:3) = 0; % clear values except red
    figure, imshow(red); % show image with only red values

    green = img;
    green(:,:,[1,3]) = 0; % clear values except green
    figure, imshow(green); % show image with only green values

    blue = img;
    blue(:,:,1:2) = 0; % clear values  except blue
    figure, imshow(blue); % show image with only blue values

    grayscale = rgb_to_grayscale(img); % convert colored image to grayscale
    figure, imshow(grayscale); % show grayscale version of image

    % figure, imshow(red + green + blue);
  end
end

