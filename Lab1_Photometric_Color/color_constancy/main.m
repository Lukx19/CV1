A = imread('awb.jpg');

output = AWB(A);


figure
subplot(1,2,1)
imshow(A)
title('Original Image ');


subplot(1,2,2)
imshow(output)
title('Color Corrected Image ');

