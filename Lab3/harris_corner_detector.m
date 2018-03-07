function [H, r, c] = harris_corner_detector(image)
    % H: cornerness 
    % r: rows of detected corners
    % c: columns of detected corners

    %for gaussian filter
    k = 10;
    sigma = 1;
   

    %derivatives of the image in x and y directions.
    [Ix, Iy] = gradient(double(image)); 
    
    % Get A by squaring Ix and convolving with Gaussian G.
    filter = fspecial('gaussian', k, sigma);
    A = conv2(Ix.^2, filter, 'same');
    
    % Get B somehow magically but for now it's just A
    B = conv2(Ix.*Iy, filter, 'same');
    
    % Get C by squaring Iy and convolving with gaussian G.
    C = conv2(Iy.^2, filter, 'same');
    
    % Use A, B and C to calculate H matrix.
    H = (A .* C - power(B, 2)) - 0.04 .* power((A + C), 2);
    
    % Get rows and columns of detected corners.
    constant = 95;
    max = ordfilt2(H,k^2,ones(k));
    threshold = mean(mean(H)) * constant;
    H=(H==max)&(H>threshold);              % Find maxima.
	
	[r, c] = find(H);                      % Find row,col coords.
    
     %figure;
     %imshow(Ix);
     
     %figure;
     %imshow(Iy);

     figure;
     imshow(image)
     hold on;
     
     % Plot corner points.
     plot(c, r, 'r.')
end