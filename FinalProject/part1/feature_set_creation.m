function [] = feature_set_creation(method ,sift_type, dataset_cagetory)

    subset_size = 50;
    
    if strcmp(dataset_cagetory, 'test')
        category_list = string({'airplanes_test' 'cars_test' 'faces_test' 'motorbikes_test'});
    end
    
    if strcmp(dataset_cagetory, 'train')
        category_list = string({'airplanes_train' 'cars_train' 'faces_train' 'motorbikes_train'});
    end
    
    image_folder = strcat('../Caltech4/ImageData/');
    extension = '*.jpg';
    feature_folder = strcat('../Caltech4/FeatureData/');
    
    %loop over dataset folder
    for i = 1:size(category_list, 2)
        current_category = char(category_list(i));
        category_folder = strcat(image_folder, current_category, '/');

        file_list = dir(fullfile(category_folder, extension));
                
        path_feature_folder = strcat(feature_folder, method, '/', sift_type, '/', 'sift', '/', current_category, '/');
        mkdir(path_feature_folder);
        
        subset_size = size(file_list) / 2;
        %iterate over the images of the selected folder
        for j = 1:subset_size
            
            %read image
            image = imread(fullfile(category_folder, file_list(j).name));
            if size(image, 3) <= 1
                continue
            end

            %extract SIFT descriptors
            [sift] = extract_sift(image, method, sift_type);
            
            %save them to a file
            save(strcat(path_feature_folder, file_list(j).name, '.mat'), 'sift');
        end
    end
end