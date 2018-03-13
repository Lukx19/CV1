function best_transform = RANSAC(N, P, T)
    % Best total inliers
    best_total = 0;

    % transformation parameters
    best_transform = [];
    
    
    for i = 1:N
        
        points_inliers = [];

        % Pick random P matches
        points = T(randperm(P), :);

        % A and b matrix consturction
        coordinates = points(1, 1:2); %get x, y
        A = [coordinates(1) coordinates(2) 0 0 1 0; 0 0 coordinates(1) coordinates(2) 0 1];
        b = points(1, 3:4)';
        for i = 1:size(points,1)
            coordinates = points(i, 1:2);
            new_one = [coordinates(1) coordinates(2) 0 0 1 0; 0 0 coordinates(1) coordinates(2) 0 1];
            A = [A;new_one];
            b = [b;points(i, 3:4)'];
        end
        
        x = pinv(A) * b;
        
   
        %Transformation
        % transformed points from image1 that lie within a radius of 10 pixels 
        % of their pair in image2.       
        for k = 1:size(T)
            coordinates_T = T(k, 1:2);
            trans_A = [coordinates_T(1) coordinates_T(2) 0 0 1 0; 0 0 coordinates_T(1) coordinates_T(2) 0 1];
            trans_b = T(k, 3:4)';
            b_calculated = trans_A * x;
            
            if abs(b_calculated-trans_b)
                points_inliers = [points_inliers;T(k, :)];
            end
        end
        
        points_total = size(points_inliers);

        if points_total > best_total
            best_total = points_total;
            best_inliers = points_inliers;
            best_transform = x;
        end
    end
    
end
