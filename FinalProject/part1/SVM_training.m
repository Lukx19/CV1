function [model1,model2,model3,model4] = SVM_training(method, sift_type)
%used to train SVM classifier

    feature_folder = strcat('../Caltech4/FeatureData/');    
    
    voc_size_str = strcat('_',num2str(400));

    subset_size = 50;
    category_list = string({'airplanes_train' 'cars_train' 'faces_train' 'motorbikes_train'});

    hist_folder = strcat(feature_folder, method ,'/', sift_type, '/', 'histograms', '/');
    histograms_all = [];
    
    %iterate over classes and load their histograms
    for i = 1:size(category_list, 2)
        current_category = char(category_list(i));
        load(strcat(hist_folder, current_category, voc_size_str,'.mat'), 'histograms');
        histograms_all = cat(1, histograms_all, histograms);
        disp(size(histograms));
    end
    %histograms_all = cat(1, histograms_all, histograms_all(end)');
    disp(size(histograms_all));


    %define true labels of separate classifiers
    label1 = cat(1, ones(subset_size, 1), zeros(2*subset_size, 1), zeros(subset_size-1, 1));
    label2 = cat(1, cat(1, zeros(subset_size, 1), ones(subset_size, 1)), zeros(subset_size, 1),zeros(subset_size-1, 1));
    label3 = cat(1, cat(1, zeros(2*subset_size, 1), ones(subset_size, 1)), zeros(subset_size-1, 1));
    label4 = cat(1, zeros(3*subset_size, 1), ones(subset_size-1, 1));

    display(size(histograms_all));
    
    %train one SVM classifier for each class
    model1 = fitcsvm(histograms_all, label1,'ClassNames',[0, 1]); %linear
    model2 = fitcsvm(histograms_all, label2,'ClassNames',[0, 1]); %linear  
    model3 = fitcsvm(histograms_all, label3,'ClassNames',[0, 1]); %linear
    model4 = fitcsvm(histograms_all, label4,'ClassNames',[0, 1]); %linear

    
end