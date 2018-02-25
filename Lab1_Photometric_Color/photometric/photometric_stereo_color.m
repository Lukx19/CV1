close all
clear all
clc

image_dir = './photometrics_images/SphereColor/';   % TODO: get the path of the script

[image_stack, scriptV] = load_syn_images(image_dir);
[h, w, n] = size(image_stack);

albedo_color = zeros(h, w, 3);
normal_color = zeros(3, h, w, 3); 

 for i = 1:3
    [image_stack, scriptV] = load_syn_images(image_dir, i);
    
    % compute the surface gradient from the stack of imgs and light source mat
    disp('Computing surface albedo and normal map...')
    [albedo, normals] = estimate_alb_nrm(image_stack, scriptV);

    albedo_color(:, :, i) = albedo;
    normal_color(i, :, :, :) = normals;
    sum(isnan(normals(:)))

 end
 
 
normal_RGB = squeeze(mean(normal_color, 1));
%imshow(normal_RGB);
norm_vector = vecnorm(normal_RGB,2,3);
norm_vector(norm_vector==0) = 1;
normal_RGB = normal_RGB./ norm_vector;


[p, q, SE] = check_integrability(normal_RGB);   



height_map = construct_surface( p, q, 'average');


show_results(albedo_color, normal_RGB, SE);
show_model(albedo_color, height_map);

