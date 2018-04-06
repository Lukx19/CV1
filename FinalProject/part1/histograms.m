function [] = histograms(method, sift_type, dataset_cagetory,vocabulary_size)
    %vocabulary_size = 400;
    %file voc_size_str for finding the vocabulary file
    subset_size = 50;
    filenames = [];
    voc_size_str = strcat('_', num2str(vocabulary_size));

    if strcmp(dataset_cagetory, 'test')
        category_list = string({'airplanes_test' 'cars_test' 'faces_test' 'motorbikes_test'});
    end
    
    if strcmp(dataset_cagetory, 'train')
        category_list = string({'airplanes_train' 'cars_train' 'faces_train' 'motorbikes_train'});
        subset_size = 50;
    end

    extension = '*.jpg.mat';
    feature_folder = strcat('../Caltech4/FeatureData/');    
    %load the vocabulary
    structure = load(strcat(feature_folder, method, '/', sift_type, '/', 'vocabulary', '/', 'vocabulary', voc_size_str));
    clusters = structure.C;
    cluster_num = size(clusters, 1);


    %iterate over the SIFT features dataset folders
    for i = 1:size(category_list, 2)
        histograms = [];
        current_category = char(category_list(i));

        category_list_dir = strcat(feature_folder, method, '/', sift_type, '/', 'sift', '/', current_category, '/');

        file_list = dir(fullfile(category_list_dir, extension));
        
        dictionary_hist = {};
        %subset_size = size(file_list);
        display(size(file_list));
        %iterate over the SIFT features' files
        for j = 1:subset_size
            feature_file_path = strcat(feature_folder, method, '/', sift_type, '/', 'sift', '/', current_category, '/', file_list(j).name);
            %display(feature_file_path);
            %read SIFT features for the specified image
            load(feature_file_path, 'sift');

            %generate histogram

            %idx : Input data indices of the nearest neighbors, returned as a numeric matrix or cell array of numeric vectors.
            idx = knnsearch(double(clusters), double(sift'));

            padding_min = zeros(1,min(idx)-1);
            padding_max = zeros(1,cluster_num-max(idx));

            %histcounts(X) partitions the X values into bins, and returns the count in each bin, as well as the bin edges
            hist_bins = histcounts(idx, max(idx)- min(idx)+1);
            hist_padded = cat(2, padding_min, hist_bins, padding_max);
            histogram = hist_padded ./ max(hist_padded);
            
            %store histogram in a matrix
            histograms = cat(1, histograms, histogram);
            filenames = cat(1, filenames, file_list(j).name);
            
        end
        %save the histograms to a file
        path_histogram = strcat(feature_folder, method, '/', sift_type, '/', 'histograms', '/');
        mkdir(path_histogram);
        save(strcat(path_histogram, current_category, voc_size_str, '.mat'), 'histograms');
        
        
        path_histogram_names = strcat(feature_folder, method, '/', sift_type, '/', 'histogram_names', '/');
        mkdir(path_histogram_names);
        save(strcat(path_histogram_names, current_category, voc_size_str, '.mat'), 'filenames');

        
    end

end
