function [ PSNR ] = myPSNR( orig_image, approx_image )

mn = numel(orig_image);

original = im2double(orig_image);
approx = im2double(approx_image);
Imax = max(original(:));
errors = (original - approx) .^ 2;
RMSE = sqrt(sum(errors(:)) / mn);
PSNR = 20 * log10(Imax / RMSE);

end

