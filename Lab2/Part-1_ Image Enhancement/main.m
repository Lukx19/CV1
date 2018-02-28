clear
clc
close all

orig_im = imread('images/image1.jpg');
salt_pepper_im = imread('images/image1_saltpepper.jpg');
gaussian_im = imread('images/image1_gaussian.jpg');

%question 1 PSNR
psnr_sp = myPSNR(orig_im, salt_pepper_im);
fprintf('PSNR for salt and pepper image');
display(psnr_sp);


%question 2 PSNR
psnr_gauss = myPSNR(orig_im, gaussian_im);
fprintf('PSNR for gaussian image');
display(psnr_gauss);




%% Question 7, part 1, section a) Box filtering of size: 3x3, 5x5, and 7x7
I = imread('images/image1_gaussian.jpg');
filter_types = ["box", "median"];
filter_sizes = [3,5,7];
%
figure;
title("image1_gaussian");
subplot(3,3,1);
imshow(orig_im);
title("original image");

subplot(3,3,2);
imshow(I);
title("gaussian");

%kernel_type = box
denoised = denoise(I, "box", 3);
subplot(3,3,4);
imshow(denoised);
title("type = box, size = 3");
fprintf('PSNR box size = 3 %f \n', myPSNR(orig_im, denoised));


denoised = denoise(I, "box", 5);
subplot(3,3,5);
imshow(denoised);
title(" type = box, size = 5");
fprintf('PSNR box size = 5 %f \n', myPSNR(orig_im, denoised));

denoised = denoise(I, "box", 7);
subplot(3,3,6);
imshow(denoised);
title("type = box, size = 7");
fprintf('PSNR box size = 7 %f \n', myPSNR(orig_im, denoised));


%kernel_type = median

denoised = denoise(I, "median", 3);
subplot(3,3,7);
imshow(denoised);
title("type = median, size = 3");
fprintf('PSNR median size = 3 %f \n', myPSNR(orig_im, denoised));


denoised = denoise(I, "median", 5);
subplot(3,3,8);
imshow(denoised);
title("type = median, size = 5");
fprintf('PSNR median size = 5  %f \n', myPSNR(orig_im, denoised));

denoised = denoise(I, "median", 7);
subplot(3,3,9);
imshow(denoised);
title("type = median, size = 7");
fprintf('PSNR median size = 7 %f \n', myPSNR(orig_im, denoised));


 %}
% d) denoising image1 using a Gaussian filtering sigma = 0.5, 1 , 2

figure;
title("image1_gaussian");
subplot(2,3,1);
imshow(orig_im);
title("original image");

subplot(2,3,2);
imshow(I);
title("gaussian");

I = imread('images/image1_gaussian.jpg');
sigma = [0.5, 1 , 2];
kernel_size = ceil(4 * sigma(1) + 1); % use +- 4 times sigma + 1 as kernel size
if mod(kernel_size,2) == 0
   kernel_size = kernel_size - 1; % kernel size should be odd number
end

denoised = denoise(I, 'gaussian', kernel_size, sigma(1));

figure;
subplot(2,3,4);
imshow(denoised);
title("sigma = 0.5, size = 3");
fprintf('PSNR gaussian sigma = 0.5 %f \n', myPSNR(orig_im, denoised));


kernel_size = ceil(4 * sigma(2) + 1); % use +- 4 times sigma + 1 as kernel size
if mod(kernel_size,2) == 0
   kernel_size = kernel_size - 1; % kernel size should be odd number
end

denoised = denoise(I, 'gaussian', kernel_size, sigma(2));

subplot(2,3,5);
imshow(denoised);
title("sigma = 1 , size = 5");
fprintf('PSNR gaussian sigma = 1 %f \n', myPSNR(orig_im, denoised));


kernel_size = ceil(4 * sigma(3) + 1); % use +- 4 times sigma + 1 as kernel size

denoised = denoise(I, 'gaussian', kernel_size, sigma(3));

subplot(2,3,6);
imshow(denoised);
title("sigma = 2, size = 9");
fprintf('PSNR gaussian sigma = 2 %f \n', myPSNR(orig_im, denoised));
%{
% different sigma, same kernel_size

I = imread('images/image1_gaussian.jpg');

figure;
title("image1_gaussian");
subplot(2,3,1);
imshow(orig_im);
title("original image");
subplot(2,3,2);
imshow(I);
title("gaussian image");

kernel_size = 3;

sigma = [0.5, 1 , 2];
denoised = denoise(I, 'gaussian', kernel_size, sigma(1));
subplot(2,3,4);
imshow(denoised);
title("sigma = 0.5, size =3 ");
fprintf('PSNR gaussian sigma = 0.5 %f \n', myPSNR(orig_im, denoised));

denoised = denoise(I, 'gaussian', kernel_size, sigma(2));
subplot(2,3,5);
imshow(denoised);
title("sigma = 1, size = 3 ");
fprintf('PSNR gaussian sigma = 1 %f \n', myPSNR(orig_im, denoised));

denoised = denoise(I, 'gaussian', kernel_size, sigma(3));
subplot(2,3,6);
imshow(denoised);
title("sigma = 2, size =3 ");
fprintf('PSNR gaussian sigma = 2 %f \n', myPSNR(orig_im, denoised));



%}
%{
%% Question 8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2 = imread('images/image2.jpg');

[Gx, Gy, im_magnitude,im_direction] = compute_gradient(I2);

figure;
subplot(2,2,1);
imshow(Gx);
title("The gradient of the image in the x-direction");


subplot(2,2,2);
imshow(Gy);
title("The gradient of the image in the y-direction");


subplot(2,2,3);
imshow(im_magnitude);
title("The magnitude of the image");

subplot(2,2,4);
imshow(im_direction);
title("The direction of the image");



%% Question 9 %%%%%%%%%%%%%%%%%%%%%%%%%%%
I2 = imread('images/image2.jpg');
I2_gaussian = compute_LoG(I2, 1);
I2_log = compute_LoG(I2, 2);
I2_dog = compute_LoG(I2, 3);
figure;
subplot(1,3,1);
imshow(I2_gaussian), title('Laplace & Gaussian');
subplot(1,3,2);
imshow(I2_log), title('LoG filter');
subplot(1,3,3);
imshow(I2_dog), title('Dog filter');

%}
