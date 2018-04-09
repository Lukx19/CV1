run('../vlfeat/toolbox/vl_setup')

%kernels: "rgb, linear"

method = 'keypoint', 'dense'
types = 'graySIFT', 'opponentSIFT', 'rgb_SIFT', 'RGB_SIFT'

vocabulary_size = 400;

%% KEYPOINT grayscale, opponent, rgb, RGB SIFTs

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


%%%%%% graySIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_graySIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% opponentSIFT, kernel = linear %%%%%%

method = 'keypoint';
type = 'opponentSIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_opponentSIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%% opponentSIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_opponentSIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}
%%%%%% rgbSIFT, kernel = linear %%%%%%

method = 'keypoint';
type = 'rgbSIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_rgbSIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%% rgbSIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_rgbSIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%% RGB_SIFT, kernel = linear %%%%%%

method = 'keypoint';
type = 'RGB_SIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_RGB_SIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%% RGB-SIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'keypoint_RGB_SIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);

%% DENSE grayscale, opponent, rgb, RGB SIFTs

%%%%%% graySIFT, kernel = linear %%%%%%

method = 'dense';
type = 'graySIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_graySIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%% graySIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_graySIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% opponentSIFT, kernel = linear %%%%%%

method = 'dense';
type = 'opponentSIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_opponentSIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%% opponentSIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_opponentSIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% rgbSIFT, kernel = linear %%%%%%

method = 'dense';
type = 'rgbSIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models
fprintf("%models are trained ");

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_rgbSIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%% rgbSIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_rgbSIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% RGB_SIFT, kernel = linear %%%%%%

method = 'dense';
type = 'RGB_SIFT';
kernel = 'linear';

% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_RGB_SIFT_linear';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);


%%%%%% RGB-SIFT, kernel = rbf %%%%%%

kernel = 'rbf';
% TRAINING PART
models = {};
[models{1} , models{2}, models{3}, models{4}] = SVM_training(method, type,vocabulary_size,kernel); % SVM %models

% TESTING PART
[mAP, ave_precisions, image_rankings] = SVM_test(method, type, models,vocabulary_size);
name = 'dense_RGB_SIFT_rbf';
generate_html(method, type, image_rankings, mAP, ave_precisions, vocabulary_size, kernel,name);
