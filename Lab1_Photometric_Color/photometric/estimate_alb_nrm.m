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
        %   stack image values into a vector of length N (for N images)
        %   and add to scriptI diagonal.
        i = zeros(N, 1);
        scriptI = zeros(N, N);
        
        for n = 1:N
            i(n) = image_stack(x, y, n);
            scriptI(n, n) = i(n);
        end        
        
        % solve scriptI * scriptV * g = scriptI * i to obtain g for this point
        if shadow_trick == true
            scriptI = diag(i);
            g = linsolve(scriptI * scriptV, scriptI * i);
        else
            g = linsolve(scriptV, i);
        end
        albedo(x,y) = norm(g);
        
        %   normal at this point is g / |g|
        normal(x, y, :) = g / norm(g);
    end
   
end

% =========================================================================

end

