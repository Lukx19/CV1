close all

imgA = imread('left.jpg');
imgB = imread('right.jpg');
R= [0.9962 0.0871 211.334; -0.0856 0.9964 37.4448 ; 0 0 1];

figure;
imshow(stitch(imgA,imgB,1000,50,R))

R= [0.9990 -0.0878 -207.8704; 0.0851 0.9963 -55.3042 ; 0 0 1];
figure;
imshow(stitch(imgB,imgA,1000,100,R))