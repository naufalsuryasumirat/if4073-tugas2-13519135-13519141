% Source code dari tugas 1 sebelumnya (13519135 dan 13519029)

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
