function [output_image] = rgb2grays(input_image)
% converts an RGB into grayscale by using 4 different methods

%[r, g, b] = getChannels(input_image);

% ligtness method
output_image(:,:,1) = (max(input_image, [], 3) + min(input_image, [], 3))/2;
% average method
 [r, g, b] = getColorChannels(input_image);
 output_image(:,:,2) = (r+g+b)/3;
% luminosity method
 %[r, g, b] = getChannels(input_image);
 output_image(:,:,3) = 0.21*r+0.72*g+0.07*b;
% built-in MATLAB function 
output_image(:,:,4) = rgb2gray(input_image);
 
end

