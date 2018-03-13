function matches = keypoint_matching(image1, image2)
    % Finds the key points in each image

    %the SIFT frames(keypoints) F of the image, the SIFT descriptors D.
    [F1,D1] = vl_sift(image1);
    [F2,D2] = vl_sift(image2);

    [match_set, S] = vl_ubcmatch(D1, D2);

    random_total = randperm(size(F1,2)) ;
    random_set = random_total(1:50) ;
    imshow(image1, [min(min(image1)),max(max(image1))]);
    hold on
    % vl_plotframe : returns the handle H of the graphical object representing the frames.
    H1 = vl_plotframe(F1(:,random_set)) ;

    set(H1,'color','y','linewidth',2) ;
    
    hold off
    
    
    
       %padarray : pads array A with 0's (zeros).
    row_num_to_pad = max(size(image2,1)-size(image1,1),0) ;
    col_num_to_pad = max(size(image1,1)-size(image2,1),0) ;
    image1_padded = padarray(image1,row_num_to_pad,'post');
    image2_padded = padarray(image2,col_num_to_pad,'post');
    
    figure();
    imshow([image1_padded image2_padded], [min(min(image1)),max(max(image1))]) ;
    
    offset = size(image1,2) ;
    
    line([F1(1,match_set(1,1:50));F2(1,match_set(2,1:50))+offset], [F1(2,match_set(1,1:50));F2(2,match_set(2,1:50))],'LineStyle','-') ;

    
    matches = zeros(size(match_set,1),4);

    F1 = F1';
    F2 = F2';
    match_set = match_set';

    for x=1:size(match_set)
        matches(x,:) = [F1(match_set(x,1),1:2),F2(match_set(x,2),1:2)];
    end
    
    
end