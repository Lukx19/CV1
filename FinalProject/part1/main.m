run('../vlfeat/toolbox/vl_setup')

%method = 'keypoint' , 'dense'=
%types = 'graySIFT', 'opponentSIFT', 'rgb_SIFT', 'RGB_SIFT'

vocabulary_size = 400;

%% KEYPOINT grayscale, opponent, rgb SIFTs
% TRAINING PART

method = 'keypoint';
dataset = 'train';

type = 'graySIFT';

feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
fprintf("feature creation is done ");
vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
fprintf("vocabulary is created ");
histograms(method, type, dataset,vocabulary_size); %create histograms using the vocabulary
fprintf("histograms for training is created ");

% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset, vocabulary_size); %create test histograms using the vocabulary

%%%%%%%%%%%%%%%%%%%%%%%%
% TRAINING PART
dataset = 'train';

type = 'opponentSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type, vocabulary_size); %create vocabulary for this SIFT method and type
histograms(method, type, dataset,vocabulary_size);

% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRAINING PART
method = 'keypoint';
dataset = 'train';
type = 'rgbSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type,vocabulary_size); %create vocabulary for this SIFT method and type
histograms(method, type, dataset,vocabulary_size);


% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary


% TRAINING PART
dataset = 'train';
type = 'RGB_SIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type,vocabulary_size); %create vocabulary for this SIFT method and type
histograms(method, type, dataset,vocabulary_size);

% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% DENSE grayscale, opponent, rgb SIFTs
% TRAINING PART

method = 'dense';
dataset = 'train';

type = 'graySIFT';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
vocabulary_creation(method, type,vocabulary_size); %create vocabulary for this SIFT method and type
histograms(method, type, dataset,vocabulary_size);

% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRAINING PART

dataset = 'train';
type = 'opponentSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type,vocabulary_size); %create vocabulary for this SIFT method and type


% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TRAINING PART
dataset = 'train';
type = 'rgbSIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type,vocabulary_size); %create vocabulary for this SIFT method and type
histograms(method, type, dataset,vocabulary_size);

% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary

% TRAINING PART
dataset = 'train';
type = 'RGB_SIFT';
feature_set_creation(method, type,dataset);
vocabulary_creation(method, type,vocabulary_size); %create vocabulary for this SIFT method and type
histograms(method, type, dataset,vocabulary_size);

% TESTING PART

dataset = 'test';
feature_set_creation(method, type, dataset); %extract SIFT features from whole dataset
histograms(method, type, dataset,vocabulary_size); %create test histograms using the vocabulary



