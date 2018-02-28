function [ imOut ] = denoise( image, kernel_type, varargin)
switch kernel_type
    case 'box'
        imOut = imboxfilt(image, varargin{1});
    case 'median'
        switch nargin
            case 3
                imOut = medfilt2(image, [varargin{1}, varargin{1}]);
            case 4
                imOut = medfilt2(image, [varargin{1}, varargin{2}]);
            otherwise
                error('Invalid number of parameters for median filtering') 
        end
    case 'gaussian'
        %varargin{1} = kernel_size, varargin{2} = sigma 
        filter = gauss2D(varargin{2}, varargin{1});
        imOut = imfilter(image, filter);
    
end
