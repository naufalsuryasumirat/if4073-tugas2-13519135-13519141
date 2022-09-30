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
