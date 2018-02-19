function [output] = AWB(I)
    [w,h,~]=size(I);
    red      = sum(sum(I(:,:,1)))/(w*h);
    green      = sum(sum(I(:,:,2)))/(w*h);
    blue      = sum(sum(I(:,:,3)))/(w*h);
    average        = mean([red green blue]);
    Kr         = average/red;
    Kg         = average/green;
    Kb         = average/blue;
    output(:,:,1) = Kr*double(I(:,:,1));
    output(:,:,2) = Kg*double(I(:,:,2));
    output(:,:,3) = Kb*double(I(:,:,3));
    output = uint8(output);
    
end