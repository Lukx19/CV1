clear
clc
close all

orig_image = imread('ball.png');
ref_image = imread('ball_reflectance.png');
shade_image = (imread('ball_shading.png'));
constructed_image = iid_image_formation(ref_image, shade_image);


disp('True material color : ');

R = max(max(ref_image(:,:,1)));
G = max(max(ref_image(:,:,2)));
B = max(max(ref_image(:,:,3)));

disp(R)
disp(G)
disp(B)


image_puregreen = recoloring(ref_image, shade_image, 0, 255, 0);
image_magenta = recoloring(ref_image, shade_image, 255, 0, 255);




figure;
subplot(1,4,1);
imshow(orig_image);
title('Original Image');

subplot(1,4,2);
imshow(im2double(ref_image));
title('Reflectance');


subplot(1,4,3);
imshow(im2double(shade_image));
title('Shading');


subplot(1,4,4);
imshow(constructed_image);
title('Constructed Image');



subplot(1,3,1);
imshow(image_puregreen);
title('Pure Green Image');


subplot(1,3,2);
imshow(image_magenta);
title('Magenta Image');


subplot(1,3,3);
imshow(orig_image);
title('Original Image');

