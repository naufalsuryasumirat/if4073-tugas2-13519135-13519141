%{
  Description: Function to add noise to image (salt and pepper)
  Output: Image with salt and pepper noise added
  Input: Image matrix
%}
function noise_added = noise_add_sp(mat)
    noise_added = imnoise(mat, 'salt & pepper', 0.05);
end
