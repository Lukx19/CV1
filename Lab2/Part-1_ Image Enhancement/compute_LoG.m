function imOut = compute_LoG(image, LOG_type)

switch LOG_type
    case 1
        %method 1
        g = fspecial('gaussian', [5 5], 0.5);

        h = fspecial('laplacian');
        smooth = imfilter(image, g);
        imOut = imfilter(smooth, h);
    case 2
        %method 2
        h = fspecial('log', [5 5], 0.5);
        imOut = imfilter(image, h);
    case 3
        %method 3
        sigma1 = 1.2;
        sigma2 = 0.75;
        imOut = imgaussfilt(image, sigma1) - imgaussfilt(image, sigma2);
  
end
end

