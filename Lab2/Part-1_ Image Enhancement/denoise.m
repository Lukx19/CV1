function [ imOut ] = denoise( image, kernel_type, varargin)

    if kernel_type == 'box'
        imOut = imboxfilt(image, varargin{1});
    end
    
    if kernel_type == 'median'
        imOut = medfilt2(image, [varargin{1}, varargin{1}]);
    end
    
    if kernel_type == 'gaussian'
        h = gauss2D(varargin{1}, varargin{2});
        imOut = imfilter(image, h);
    end
    
end
