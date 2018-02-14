function [constructed_image] = iid_image_formation(R,S)

constructed_image = zeros(size(R));


for i = (1:3)
    constructed_image( :, :, i) = R( :, :, i).*S;
end

end


