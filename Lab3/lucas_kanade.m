function [row, column] = lucas_kanade(image1, image2, window_size ,r, c, image_name)
    % Estimated as v = (A^T A)^-1 A^Tb. 
    % Get size of images.
    [h, w] = size(image1);

    Vx = [];
    Vy = [];
    X = [];
    Y = [];
    
    if nargin < 4
         % Divide input images on non-overlapping regions, each region being 1
        for x = 1:floor(h/window_size)
            for y = 1:floor(w/window_size)
           
            x_end = x * window_size;
            y_end = y * window_size;

            region1 = image1((x_end - window_size+1):x_end, (y_end - window_size+1):y_end);
            region2 = image2((x_end - window_size+1):x_end, (y_end - window_size+1):y_end);

            % For each region compute A, AT and b; then estimate optical flow as given in equation (20).
            imdouble = im2double(region1);
            [Ix1, Iy1] = gradient(imdouble);

            Ix1 = Ix1(:);
            Iy1 = Iy1(:);
        
            region_It = conv2(double(region1), ones(2), 'same') + conv2(double(region2), -ones(2), 'same'); % partial on t
            %region_It = double(region1) - double(region2);
            b = -region_It(:); % get b here
            A = [Ix1,Iy1]; % coefficients for x and y gradients
      
            solution = pinv(A)*b; % solve linear over determined system

            X = [X, y_end-7];
            Y = [Y, x_end-7];
            Vx = [Vx, solution(1)]; % velocity x coord is solution to first unknown
            Vy = [Vy, solution(2)];
            % Now we have optical flow (Vx,Vy) of each region.
            end
        end
        
        %quiver plots a set of two-dimensional vectors as arrows on the screen. 
        figure();
        imshow(image2);
        hold on;
        % draw the velocity vectors
        quiver(X, Y, Vx, Vy, 'y');
    
    %This part is for tracking
    else

        row = [];
        column = [];
        for corner = 1:length(r)

            x = round(c(corner));
            y = round(r(corner));

            if x - floor(window_size/2) < 1
                x = floor(window_size/2) + 1;
            elseif x + floor(window_size/2) > h
                x = h - floor(window_size/2);
            end
            if y - floor(window_size/2) < 1
                y = floor(window_size/2) + 1;
            elseif y + floor(window_size/2) > w
                y = w - floor(window_size/2);
            end
          
            w_half = floor(window_size/2);
            region1 = (image1((y - w_half):(y + w_half+1),(x - w_half):(x + w_half+1)));
            region2 = (image2((y - w_half):(y + w_half+1),(x - w_half):(x + w_half+1)));


            [Ix1, Iy1] = imgradientxy(double(region1));
            %figure();
            %imshow(Ix1);
            %hold on;
            %saveas(gcf, strcat(string(corner),"1.jpg"))
            
            Ix1 = Ix1(:);
            Iy1 = Iy1(:);
            %region_It = conv2(double(region2), ones(2), 'same') - conv2(double(region1), ones(2), 'same');
            region_It = double(region2) - double(region1);
            b = -region_It(:); % get b here
            A = [Ix1,Iy1];
 
            %solution = pinv(A)*b; % solve linear over determined system
            %solution =pinv(A'*A) *A'*b;
            solution = mldivide(A,b);
            X = [X, x];
            Y = [Y, y];
            Vx = [Vx, solution(1)];
            Vy = [Vy, solution(2)];
            row = [row; r(corner)+ 10* solution(2)];
            column = [column; c(corner)+10* solution(1)];        
        end
        figure();
        imshow(image1);
        hold on;
        plot(c, r, 'r.');
        quiver(X, Y, Vx, Vy, 'r');
        saveas(gcf, image_name)
    end
    
end