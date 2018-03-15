function [resImg] = stitch(imgA,imgB,Iter,Sampels,T)
    if nargin < 5
        matches = keypoint_matching(single(rgb2gray(imgA)),single(rgb2gray(imgB)));
        tp = RANSAC(Iter, Sampels, matches);
        T = [tp(1,1) tp(2,1) tp(5,1) ;tp(3,1) tp(4,1) tp(6,1); 0 0 1];
    end

    sizeA = size(imgA);
    sizeB = size(imgB);
    imgA = im2double(imgA);
    imgB = wrap(im2double(imgB),T,'translate');
    sizeBw = size(imgB)
    
    cornersB = [1 sizeB(2) 1 sizeB(2); 1 1 sizeB(1) sizeB(1);1 1 1 1];
    Tcorners = T* cornersB;
    x_cor = [Tcorners(1,:),sizeA(2),1];
    y_cor = [Tcorners(2,:),sizeA(1),1];
    xMax = max(x_cor)
    xMin = min(x_cor)
    yMax = max(y_cor)
    yMin = min(y_cor)
    width  = round(xMax - xMin);
    height = round(yMax - yMin);
    resImg = zeros(height,width);
    
    TA = [-xMin;-yMin;];
    for y=2:sizeA(1)-1
        for x=2:sizeA(2)-1
            xy = ([x; y] + TA);
            xy = round(xy);
            for c=1:sizeB(3)
                resImg(xy(2),xy(1),c) = imgA(y,x,c);
            end 
        end
    end

    for y=2:sizeBw(1) -1
        for x=2:sizeBw(2)-1
            xy = ([x; y]);
            xy = round(xy);
            for c=1:sizeBw(3)
                if(imgB(y,x,c) > 0)
                    if(resImg(xy(2),xy(1),c) > 0)
                        resImg(xy(2),xy(1),c) = (imgB(y,x,c) + resImg(xy(2),xy(1),c)) /2;
                    else
                        resImg(xy(2),xy(1),c) = imgB(y,x,c);
                    end
                end
            end
            
        end
    end
end

