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
 end
 
p_color = zeros(3, h, w);
q_color = zeros(3, h, w);
SE_color = zeros(3, h, w);

for k = 1:3
    disp('Integrability checking')
    [~, h, w, d] = size(normal_color(k, :, :, :));
    
    [p, q, SE] = check_integrability(reshape(normal_color(k, :, :, :), [h, w, d]));   
    
    p_color(k, :, :) = p;
    q_color(k, :, :) = q;
    
    SE_color(k, :, :) = SE;
    
end

height_map = zeros(3, h, w);

for i = 1:3
    height_i = construct_surface( p, q, 'column');
    height_map(i, :, :) = height_i;
end


height_map_RGB = zeros(h, w);
normals_RGB = zeros(h, w, 3);
SE_RGB = zeros(h, w);

for i = 1:3
   normals_RGB = normals_RGB + reshape(normal_color(i, :, :, :), [h, w, 3])./ 3;
   height_map_RGB = height_map_RGB + reshape(height_map(i, :, :), [h, w])./ 3;
   SE_RGB = SE_RGB + reshape(SE_color(i, :, :), [h, w])./ 3;
end

show_results(albedo_color, normals_RGB, SE_RGB);
show_model(albedo_color, height_map_RGB);

