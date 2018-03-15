function [resImg] = wrap(img,T,Translate)
    T(3,1:2) = 0;
    if ~strcmp(Translate,'translate')
        T(1:2,3) = 0;
    end
    
    imgSize = size(img);    
    corners = [1 imgSize(2) 1 imgSize(2); 1 1 imgSize(1) imgSize(1);1 1 1 1];
    Tcorners = T* corners
    xcor = [Tcorners(1,:) 1];
    ycor = [Tcorners(2,:) 1];
    xMax = max(xcor)
    xMin = min(xcor)
    yMax = max(ycor)
    yMin = min(ycor)
    width  = round(xMax - xMin);
    height = round(yMax - yMin);
    
    if length(imgSize) == 3
        resImg = zeros(height,width,imgSize(3));
    else
        resImg = zeros(height,width);
    end
    if strcmp(Translate,'translate')
        if T(1,3) < 0
            T(1,3) = T(1,3) -xMin;
        end
        if T(2,3) < 0
            T(2,3) = T(2,3) -yMin;
        end
    else
       T(1,3) = T(1,3) -xMin;
       T(2,3) = T(2,3) -yMin;
    end
    T = inv(T);
%     T* corners
    for y=1:height
        for x=1:width
            xy = (T * [x; y ;1]);
            xy = round(xy);
            if xy(1) < 1 || xy(1)> imgSize(2) || xy(2)< 1 || xy(2)> imgSize(1)
                continue;
            end
            if length(imgSize) == 3
                for c=1:imgSize(3)
                    resImg(y,x,c) = img(xy(2),xy(1),c);
                end
            else
                resImg(y,x) = img(xy(2),xy(1));
            end
            
             
        end
    end
end

