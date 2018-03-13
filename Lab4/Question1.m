run('vlfeat/toolbox/vl_setup')

boat1 = single(imread('boat1.pgm'));
boat2 = single(imread('boat2.pgm'));


matches_50 = keypoint_matching(boat1,boat2);


% Iterations of RANSAC
N = 100;
% Amount of matches to sample
P = 100;



transformation_matrix = RANSAC(N, P, matches_50);

aligned_image = zeros(size(boat2));


for x=1:size(aligned_image,1)
    for y=1:size(aligned_image,2)
        A = [x y 0 0 1 0; 0 0 x y 0 1];
        coordinates = A*transformation_matrix;
        x_new = min(max(1,round(coordinates(1))),size(aligned_image,1));
        y_new = min(max(1,round(coordinates(2))),size(aligned_image,2));
        aligned_image(x_new,y_new) = boat2(x,y);
    end
end

%rotated image
figure;
imshow([boat1,aligned_image], [min(min(aligned_image)),max(max(aligned_image))]);

