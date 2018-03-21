function [sift] = extract_sift(input_image, method, sift_type)
%used to extract SIFT feature from an image

if strcmp(sift_type, 'opponentSIFT')
% converts an RGB image into opponent color space
    r = input_image(:,:,1);
    g = input_image(:,:,2);
    b = input_image(:,:,3);

    image  = input_image(:,:,:);
    image(:,:,1) = (r - g)/sqrt(2);
    image(:,:,2) = (r + g - 2*b)/sqrt(6);
    image(:,:,3) = (r + g + b)/sqrt(3);
    input_image = image;
end

if strcmp(sift_type, 'rgbSIFT')
    % converts an RGB image into normalized rgb
    r = input_image(:,:,1);
    g = input_image(:,:,2);
    b = input_image(:,:,3);

    image = input_image(:,:,:);
    image(:,:,1) = r./(r+g+b);
    image(:,:,2) = g./(r+g+b);
    image(:,:,3) = b./(r+g+b);
    input_image = image;

end

if strcmp(sift_type, 'graySIFT')
    grayscale_image = im2single(rgb2gray(input_image));
end
    
if strcmp(method, 'dense')
    if strcmp(sift_type, 'graySIFT')
        [~,sift] = vl_dsift(grayscale_image, 'step', 10);
    else
    
        [f,~] = vl_dsift(grayscale_image, 'step', 10) ;
        
        %set the magnitude and rotation of the features
        f(3,:) = 1 ;
        f(4,:) = 0 ;
        
        %find the features at the positions of the grayscale features
        [~, R_sift] = vl_sift(im2single(input_image(:,:,1)), 'frames', f);
        [~, G_sift] = vl_sift(im2single(input_image(:,:,2)), 'frames', f);
        [~, B_sift] = vl_sift(im2single(input_image(:,:,3)), 'frames', f);
        
        sift = cat(1, R_sift, G_sift, B_sift);
        
    end
    
elseif strcmp(method, 'keypoint')
    if strcmp(sift_type, 'graySIFT')
        %retrieve dense grayscale SIFT features directly
        [~,sift] = vl_sift(grayscale_image) ;
    else
        %retrieve dense grayscale SIFT features 
        [f,~] = vl_sift(grayscale_image) ;
        
        %find the features at the positions of the grayscale features
        [~, R_sift] = vl_sift(im2single(input_image(:,:,1)), 'frames', f);
        [~, G_sift] = vl_sift(im2single(input_image(:,:,2)), 'frames', f);
        [~, B_sift] = vl_sift(im2single(input_image(:,:,3)), 'frames', f);
        
        %construct colorSift (channels based on the sift type)
        sift = cat(1, R_sift, G_sift, B_sift);
    end
end

end