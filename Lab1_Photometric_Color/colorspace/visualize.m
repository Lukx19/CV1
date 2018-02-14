function visualize(input_image)
    [h, w, d] = size(input_image);
    for i=1:d
        subplot(1,d,i)
        imshow(input_image(:,:,i))
    end
end


