clear
clc
close all

orig_image = imread('ball.png');
ref_image = im2double(imread('ball_reflectance.png'));
shade_image = im2double(imread('ball_shading.png'));
constructed_image = iid_image_formation(ref_image, shade_image);

image_puregreen = recoloring(ref_image, shade_image, 0, 255, 0);
image_magenta = recoloring(ref_image, shade_image, 255, 0, 255);

figure;
subplot(3,2,1);
imshow(orig_image);

subplot(3,2,2);
imshow(ref_image);

subplot(3,2,3);
imshow(shade_image);

subplot(3,2,4);
imshow(constructed_image);

subplot(3,2,5);
imshow(image_puregreen);

subplot(3,2,6);
imshow(image_magenta);