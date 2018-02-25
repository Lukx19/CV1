function [Gx, Gy, im_magnitude,im_direction] = compute_gradient(image)
matrix_x = [-1,0,1;-2,0,2;-1,0,1];
matrix_y = [1,2,1;0,0,0;-1,-2,-1];

Gx = conv2(double(image),double(matrix_x));
Gy = conv2(double(image),double(matrix_y));
im_magnitude = uint8(sqrt(Gx.^2 + Gy.^2));
im_direction = uint8(atand(Gy ./ Gx));
Gx = uint8(Gx);
Gy = uint8(Gy);
end

