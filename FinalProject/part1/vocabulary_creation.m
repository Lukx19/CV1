function [] = vocabulary_creation(method, sift_type, vocabulary_size)

    %vocabulary_size = 400;
        
    voc_size_str = strcat('_',num2str(vocabulary_size));
    
    image_folder = strcat('../Caltech4/ImageData/');
    extension = '*.jpg';
    feature_folder = strcat('../Caltech4/FeatureData/');    
    data_type = '*.mat';
 
    category_list = string({'airplanes_train' 'cars_train' 'faces_train' 'motorbikes_train'});
    features_ALL = [];

    for i = 1:size(category_list, 2)
        current_category = char(category_list(i));
        current_category_dir = strcat(feature_folder, method, '/', sift_type, '/', 'sift', '/', current_category, '/');
        display(current_category_dir);
        file_list = dir(fullfile(current_category_dir, data_type));
       
        subset_size = size(file_list) / 2;

        
        for j = 1:subset_size
            %load SIFT features
            load(strcat(current_category_dir, file_list(j).name), '-mat', 'sift');

            %add it to the collection of all features
            features_ALL = cat(1, features_ALL, sift');
        end
    end
    
    %run kmeans algorithm on all of the features
    display(size(features_ALL));
    [~,C] = kmeans_fast(double(features_ALL)', vocabulary_size);
    C = C';
   

    %store vocabulary to file
    vocabulary_file_path = strcat(feature_folder, method, '/', sift_type, '/', 'vocabulary', '/');
    mkdir(vocabulary_file_path);
    save(strcat(vocabulary_file_path, 'vocabulary', voc_size_str), 'C');
end