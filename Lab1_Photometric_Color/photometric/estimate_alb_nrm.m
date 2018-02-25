function [ albedo, normal ] = estimate_alb_nrm( image_stack, scriptV, shadow_trick)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal


[h, w, N] = size(image_stack);

if nargin == 2
    shadow_trick = true;
end

% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)
albedo = zeros(h, w, 1);
normal = zeros(h, w, 3);

% =========================================================================
% YOUR CODE GOES HERE
% for each point in the image array
%   stack image values into a vector i
%   construct the diagonal matrix scriptI
%   solve scriptI * scriptV * g = scriptI * i to obtain g for this point
%   albedo at this point is |g|
%   normal at this point is g / |g|

%(h is row dimension and w the columns)
for x = 1:h
    for y = 1:w
        i = reshape(image_stack(x, y, :), N, 1); 
        
        I = diag(i);
        
        if shadow_trick
            [g, ~] = linsolve(I*scriptV, I*i);
        else
            [g, ~] = linsolve(scriptV, i);
        end
        
        albedo(x, y, 1) = norm(g);
        
        if albedo(x, y, 1) > 0
            normal(x, y, :) = g / albedo(x, y, 1);
        else
            normal(x, y, :) = zeros(size(g));
        end
    end
end
% =========================================================================

end

