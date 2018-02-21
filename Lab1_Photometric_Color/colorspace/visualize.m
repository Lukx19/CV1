function visualize(input_image, I)
    [h, w, d] = size(input_image);
    
    subplot(1,d+1,1)
    imshow(I)
    
    for i=1:d
        subplot(1,d+1,i+1)
        imshow(input_image(:,:,i))
    end
end


