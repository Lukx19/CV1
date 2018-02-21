function [constructed_image] = iid_image_formation(reflectance,shade)

constructed_image = zeros(size(reflectance));

R = im2double(reflectance);
S = im2double(shade);

for i = (1:3)
    constructed_image( :, :, i) = R( :, :, i).*S;
end



end


