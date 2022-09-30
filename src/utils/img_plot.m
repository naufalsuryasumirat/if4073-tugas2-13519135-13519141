% Source code dari tugas 1 sebelumnya (13519135 dan 13519029)

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

