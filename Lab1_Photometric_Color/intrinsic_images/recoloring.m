function [image_colored] = recoloring(reflectance, shading, r, g, b)

R = max(max(reflectance(:,:,1)));
G = max(max(reflectance(:,:,2)));
B = max(max(reflectance(:,:,3)));


colored_reflectance = reflectance(:,:,:);
colored_reflectance(reflectance == R) = r;
colored_reflectance(reflectance == G) = g;
colored_reflectance(reflectance == B) = b;

image_colored = iid_image_formation(colored_reflectance, shading);



end


