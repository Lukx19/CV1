
%% main function 
nets.pre_trained = load(fullfile('data', 'pre_trained_model.mat'));

vl_simplenn_display(nets.pre_trained.net);
%% fine-tune cnn

expdir = fullfile('data', 'cnn_assignment-lenet');
%[net, info, expdir] = finetune_cnn();
%% extract features and train svm

% TODO: Replace the name with the name of your fine-tuned model
nets.fine_tuned = load(fullfile(expdir, 'batch100_40.mat')); 
data = load(fullfile(expdir, 'imdb-caltech.mat'));

%%
drawGraph(nets.fine_tuned.stats);


nets.fine_tuned = nets.fine_tuned.net;
nets.pre_trained = nets.pre_trained.net;

nets.pre_trained.layers{end}.type = 'softmax';
nets.fine_tuned.layers{end}.type = 'softmax';


[X,labels] = getFeatures(nets.pre_trained,data);
tsne(X', labels);

[X,labels] = getFeatures(nets.fine_tuned,data);
tsne(X', labels);

train_svm(nets, data);

function [X,labels]=getFeatures(net,data)
    X =[];
    labels = [];
    for i = 1:size(data.images.data, 4)
        res = vl_simplenn(net, data.images.data(:, :,:, i));
        feat = res(end-3).x; feat = squeeze(feat);
        X = [X feat];
        labels = [labels;  data.images.labels(i)];
    end
    
    %labels = double(labels);
    %X = sparse(double(X'));
end

function drawGraph(stats)
[ll,epochs] = size(stats.train);
plots = setdiff(...
 cat(2,...
      fieldnames(stats.train)', ...
      fieldnames(stats.val)'), {'num', 'time'});
 %plots = plots(1,1:2);
    for p = plots
      p = char(p) ;
      values = zeros(0, epochs) ;
      leg = {} ;
      for f = {'train', 'val'}
        f = char(f) ;
        if isfield(stats.(f), p)
          tmp = [stats.(f).(p)] ;
          values(end+1,:) = tmp(1,:)' ;
          leg{end+1} = f ;
        end
      end
      %subplot(1,numel(plots),find(strcmp(p,plots))) ;
      semilogy(1:epochs, values','o-') ;
      xlabel('epoch') ;
      title('Average error over all classes') ;
      legend(leg{:}) ;
      grid on ;
      break;
    end
    drawnow ;
end