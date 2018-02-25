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




%Question 7, part 1, section a) Box filtering of size: 3x3, 5x5, and 7x7
I = imread('images/image1_saltpepper.jpg');
filter_types = ["box", "median"];
filter_sizes = [3,5,7];
figure;
for i = 1:2
    for j = 1:3
        type = filter_types(i);
        filt_size = filter_sizes(j);
        if type == "gaussian"
            filt_size = ceil(4 * filt_size + 1); % use +- 4 times sigma + 1 as kernel size
            if mod(filt_size,2) == 0
                filt_size = filt_size - 1; % kernel size must be odd
            end
            denoised = denoise(I, type, filt_size, filter_sizes(j));
        else
            denoised = denoise(I, type, filter_sizes(j));
        end
        
        plot_ij = (i - 1) * numel(filter_sizes) + j;
        subplot(numel(filter_types), numel(filter_sizes), plot_ij);
        imshow(denoised);
        fprintf('PSNR %s %d:  %d. \n', type, filter_sizes(j), myPSNR(denoised, I));
    end
end



I2 = imread('images/image2.jpg');

[Gx, Gy, im_magnitude,im_direction] = compute_gradient(I2);

imshow(Gx)