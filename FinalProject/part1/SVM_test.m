function [mAP, ave_precisions,image_ranking]= SVM_test(method, type, models, vocabulary_size)

subset_size = 50;
voc_size_str = strcat('_',num2str(vocabulary_size));

feature_folder = strcat('../Caltech4/FeatureData/');    

category_list = string({'airplanes_test' 'cars_test' 'faces_test' 'motorbikes_test'});

histograms_test = [];

for i = 1:size(category_list, 2)
    current_category = char(category_list(i));
    hist_file = strcat(feature_folder, method, '/', type, '/', 'histograms', '/', current_category,voc_size_str ,'.mat');

    %load corresponding histograms
    load(hist_file, 'histograms');
    histograms_test = cat(1, histograms_test, histograms);
end

%define true labels of separate classifiers
label1 = cat(1, ones(subset_size, 1), zeros(2*subset_size, 1), zeros(subset_size, 1));
label2 = cat(1, cat(1, zeros(subset_size, 1), ones(subset_size, 1)), zeros(subset_size, 1),zeros(subset_size, 1));
label3 = cat(1, cat(1, zeros(2*subset_size, 1), ones(subset_size, 1)), zeros(subset_size, 1));
label4 = cat(1, zeros(3*subset_size, 1), ones(subset_size, 1));


ave_precisions = zeros(1, 4);


[~, scores] = predict(models{1}, histograms_test);
[ave_precisions(1), ranking1] = average_precision(label1, scores(:, 2));
  
[~, scores] = predict(models{2}, histograms_test);
[ave_precisions(2), ranking2] = average_precision(label2, scores(:, 2));

[~, scores] = predict(models{3}, histograms_test);
[ave_precisions(3), ranking3] = average_precision(label3, scores(:, 2));

[~, scores] = predict(models{4}, histograms_test);
[ave_precisions(4), ranking4] = average_precision(label4, scores(:, 2));
  
mAP = sum(ave_precisions)/4;



image_ranking{1} = get_image_names(ranking1);
image_ranking{2} = get_image_names(ranking2);
image_ranking{3} = get_image_names(ranking3);
image_ranking{4} = get_image_names(ranking4);


end