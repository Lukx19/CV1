function [ scriptV ] = get_source(scale_factor)
%GET_SOURCE compute illumination source property 
%   scale_factor : arbitrary 

if nargin == 0
    scale_factor = 1;
end

% define normal vectors wrt each light source (for each picture)
scriptV = double([0 0 1;
 -1, -1, 1;
 1, -1, 1;
 -1, 1, 1;
 1, 1, 1;
 ]);

%now normalize them
for x=1:size(scriptV, 1)
    scriptV(x, :) = scriptV(x, :)/norm(scriptV(x,:));
end

% TODO: define arbitrary direction to V

% TODO: normalize V into scriptV





% scale up to scale factor before return
scriptV = scale_factor * scriptV;

end

