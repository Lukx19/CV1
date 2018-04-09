run('../vlfeat/toolbox/vl_setup')


%For comparison between vocabulary sizes, we run the experiment for
%vocabular size = 400, 800, 1600 , 2000 and 4000
%we run this for only keypoint and grayscale SIFT features;


%% KEYPOINT grayscale
% TRAINING PART

method = 'keypoint';

type = 'graySIFT';

vocabulary_size = 400;
dataset = "train";

%feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
fprintf("feature creation is done ");
%vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
%%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary
fprintf("histograms for training is created ");
[model1 , model2, model3, model4] = SVM_training(method, type, vocabulary_size); % SVM models
fprintf("models are trained ");

models{1} = model1;
models{2} = model2;
models{3} = model3;
models{4} = model4;
%}
% TESTING PART

dataset = 'test';
%feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
%%histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary

[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models, vocabulary_size);

map_400 = mAP;
ap_400 = ave_precisions;

fprintf("the average precision and mAP for vocabulary 400: ");
display(ap_400);
display(map_400);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vocabulary_size = 800;
dataset = "train";


fprintf("feature creation is done ");
%vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
%%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary
fprintf("histograms for training is created ");
[model1 , model2, model3, model4] = SVM_training(method, type, vocabulary_size); % SVM models
fprintf("models are trained ");

models{1} = model1;
models{2} = model2;
models{3} = model3;
models{4} = model4;

dataset = 'test';
%%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary

[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models, vocabulary_size);

map_800 = mAP;
ap_800 = ave_precisions;

fprintf("the average precision and mAP for vocabulary 800: ");
display(ap_800);
display(map_800);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vocabulary_size = 1600;
dataset = "train";

fprintf("feature creation is done ");
%vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
%%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary
fprintf("histograms for training is created ");
[model1 , model2, model3, model4] = SVM_training(method, type, vocabulary_size); % SVM models
fprintf("models are trained ");

models{1} = model1;
models{2} = model2;
models{3} = model3;
models{4} = model4;

dataset = 'test';
%%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary

[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models, vocabulary_size);

map_1600 = mAP;
ap_1600 = ave_precisions;

fprintf("the average precision and mAP for vocabulary 1600: ");
display(ap_1600);
display(map_1600);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vocabulary_size = 2000;
dataset = "train";

fprintf("feature creation is done ");
%vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary
fprintf("histograms for training is created ");
[model1 , model2, model3, model4] = SVM_training(method, type, vocabulary_size); % SVM models
fprintf("models are trained ");

models{1} = model1;
models{2} = model2;
models{3} = model3;
models{4} = model4;

dataset = 'test';
%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary

[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models, vocabulary_size);

map_2000 = mAP;
ap_2000 = ave_precisions;

fprintf("the average precision and mAP for vocabulary 1600: ");
display(ap_2000);
display(map_2000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vocabulary_size = 4000;
dataset = "train";

fprintf("feature creation is done ");
%vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary
fprintf("histograms for training is created ");
[model1 , model2, model3, model4] = SVM_training(method, type, vocabulary_size); % SVM models
fprintf("models are trained ");

models{1} = model1;
models{2} = model2;
models{3} = model3;
models{4} = model4;

dataset = 'test';
%histograms(method, type, dataset, vocabulary_size); %create histograms using the vocabulary

[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models, vocabulary_size);

map_4000 = mAP;
ap_4000 = ave_precisions;

fprintf("the average precision and mAP for vocabulary 4000: ");
display(ap_4000);
display(map_4000);


