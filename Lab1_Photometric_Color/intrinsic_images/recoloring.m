function [image_colored] = recoloring(reflectance, shading, r, g, b)

R = max(max(reflectance(:,:,1)));
G = max(max(reflectance(:,:,2)));
B = max(max(reflectance(:,:,3)));


colored_reflectance = reflectance(:,:,:);
reflectance(reflectance == R) = r;
reflectance(reflectance == G) = g;
reflectance(reflectance == B) = b;

image_colored = iid_image_formation(reflectance, shading);
end
