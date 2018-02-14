function [ p, q, SE ] = check_integrability( normals )
%CHECK_INTEGRABILITY check the surface gradient is acceptable
%   normals: normal image
%   p : df / dx
%   q : df / dy
%   SE : Squared Errors of the 2 second derivatives

% initalization
p = zeros(size(normals,1),size(normals,2));
q = zeros(size(normals,1),size(normals,2));
SE = zeros(size(normals,1),size(normals,2));

% ========================================================================
% YOUR CODE GOES HERE
% Compute p and q, where
% p measures value of df / dx
% q measures value of df / dy

for x = 1:size(normals, 1)
    for y = 1:size(normals, 2)
        p(x,y) = normals(x,y,1)/normals(x,y,3);
        q(x,y) = normals(x,y,2)/normals(x,y,3);
    end
end


% ========================================================================


p(isnan(p)) = 0;
q(isnan(q)) = 0;



% ========================================================================
% YOUR CODE GOES HERE
% approximate second derivate by neighbor difference
% and compute the Squared Errors SE of the 2 second derivatives SE

[dpdx, dpdy] = gradient(p);
[dqdx, dqdy] = gradient(q);
SE = (dpdy - dqdx).^2;
% ========================================================================




end

