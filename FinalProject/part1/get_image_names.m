function [image_list] = get_image_names(ranking)
    
    
    image_folder = strcat('../Caltech4/ImageData/');
    image_list = {};
    
    for i= 1:size(ranking)
        rank = ranking(i);
        
        if rank < 50
          category_folder = strcat(image_folder, 'airplanes_test', '/');
          r = rank;
                
        elseif rank < 100
          category_folder = strcat(image_folder, 'cars_test', '/');
          r = rank - 50;
          if r == 0
              r = 50;
          end

                
        elseif rank < 150
          category_folder = strcat(image_folder, 'faces_test', '/');
          r = rank-100; 
          if r == 0
              r = 50;
          end
         
        else rank < 200;
          category_folder = strcat(image_folder, 'motorbikes_test', '/');
          r = rank-150;
          if r == 0
              r = 50;
          end
        end
        
        file_list = dir(fullfile(category_folder, '*.jpg'));
        image = strcat(category_folder, file_list(r).name);
        image_list{i} = image;
    end

end
