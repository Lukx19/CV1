run('../vlfeat/toolbox/vl_setup')


%% TRAINING PART
%% KEYPOINT grayscale, opponent, rgb SIFTs

method = 'keypoint';
dataset = 'train';

type = 'graySIFT';

%feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
fprintf("feature creation is done ");
%vocabulary_creation(method, type); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
%histograms(method, type, dataset); %create histograms using the vocabulary
fprintf("histograms for training is created ");
[model1 , model2, model3, model4] = SVM_training(method, type); % SVM models
fprintf("models are trained ");


dataset = 'test';
%feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
%histograms(method, type, dataset); %create test histograms using the vocabulary




%{

type = 'opponentSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type); %create vocabulary for this SIFT method and type
histograms(method, type, dataset);
models = train_SVM(method, type); % SVM models


type = 'rgbSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type); %create vocabulary for this SIFT method and type
histograms(method, type, dataset);
models = train_SVM(method, type); % SVM models


%% DENSE grayscale, opponent, rgb SIFTs

method = 'dense';
dataset = 'train';

type = 'graySIFT';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
vocabulary_creation(method, type); %create vocabulary for this SIFT method and type
histograms(method, type, dataset);
models = train_SVM(method, type); % SVM models


type = 'opponentSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type); %create vocabulary for this SIFT method and type
histograms(method, type, dataset);
models = train_SVM(method, type); % SVM models


type = 'rgbSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type); %create vocabulary for this SIFT method and type
histograms(method, type, dataset);
models = train_SVM(method, type); % SVM models

%}

%{
%construct vocabulary
method = 'dense';
type = 'rgbSIFT';

%vocabulary_creation(method, type);


%histograms(method, type, 'test');

models = train_SVM(method, type);
load('../Caltech4/FeatureData/dense/rgbSIFT/histograms/cars_test_400.mat','histograms');

labels_cat = cat(1, cat(1, zeros(subset_size, 1), ones(subset_size, 1)), zeros(subset_size, 1),zeros(subset_size-1, 1));
}

%}