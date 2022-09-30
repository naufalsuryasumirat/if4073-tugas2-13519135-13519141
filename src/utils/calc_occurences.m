% Source code dari tugas 1 sebelumnya (13519135 dan 13519029)

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
