clear all;
close all; 
clc;

%% Harris Corner Detection
toy_image = rgb2gray(imread('person_toy/00000001.jpg'));
pingpong_image = rgb2gray(imread('pingpong/0000.jpeg'));


[H, r, c] = harris_corner_detector(toy_image);
[H, r, c] = harris_corner_detector(pingpong_image);


%% Lukas Kanade Algorithm

sphere1 = imread('sphere1.ppm');
sphere2 = imread('sphere2.ppm');
synth1 = imread('synth1.pgm');
synth2 = imread('synth2.pgm');

window_size = 15;
lucas_kanade_algorithm(synth1, synth2, window_size);
lucas_kanade_algorithm(sphere1, sphere2, window_size);



%% Tracking
set(0,'DefaultFigureVisible', 'off');

% store the first image in the correct variable.
window_size = 15;

image1 = rgb2gray(imread('person_toy/00000001.jpg'));
tracking('person_toy/', image1, window_size);


image1 = rgb2gray(imread('pingpong/0000.jpeg'));
tracking('pingpong/',image1, window_size);

set(0,'DefaultFigureVisible', 'on');
implay('output_images_person_toy/video.avi')

