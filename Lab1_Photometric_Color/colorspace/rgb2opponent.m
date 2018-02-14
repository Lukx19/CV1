function [output_image] = rgb2opponent(input_image)
% converts an RGB image into opponent color space
    [r, g, b] = getColorChannels(input_image);
    output_image  = input_image(:,:,:);
    output_image(:,:,1) = (r - g)/sqrt(2);
    output_image(:,:,2) = (r + g - 2*b)/sqrt(6);
    output_image(:,:,3) = (r + g + b)/sqrt(3);
end

