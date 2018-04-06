% Demo Run
run('../vlfeat/toolbox/vl_setup')

vocabulary_size = 400;

%% KEYPOINT grayscale, opponent, rgb SIFTs
% feture set, vocabulary and histogram creations
% train set
method = 'keypoint';
dataset = 'train';

type = 'graySIFT';

%feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
fprintf("feature creation for train is done ");
%vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
histograms(method, type, dataset,vocabulary_size); %create histograms using the vocabulary
fprintf("histograms for training are created ");

% test set
dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
fprintf("feature creation for test is done ");
histograms(method, type, dataset, vocabulary_size); %create test histograms using the vocabulary
fprintf("histograms for test are created ");

% CLASSIFICATION
%%%%%% graySIFT, kernel = linear %%%%%%

method = 'keypoint';
type = 'graySIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_graySIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);

