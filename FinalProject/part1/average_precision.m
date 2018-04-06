function [AP, rank_list] = average_precision(labels, scores)
%calculate average precision of a ranklist with scores and true labels

    index_list = 1:size(labels);
    
    %construct ranking
    ranking = cat(2, scores, labels, index_list');
    
    ranking = sortrows(ranking,1);
    ranking = flipud(ranking);
    
    %calculate f_c
    f_c = zeros(size(labels,1), 1);
    counter = 0;
    for i=1:size(labels)
        counter = counter + ranking(i,2);
        f_c(i)  = counter;
        if ranking(i,2) == 0
            f_c(i) = 0;
        end
        
    end
    
    %calculate AP
    i = 1:size(labels);
    i=i';
    AP = sum(f_c./i)/max(f_c);
    
    rank_list = ranking(:,3);
    
end