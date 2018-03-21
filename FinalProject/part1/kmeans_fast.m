function [class, mu] = kmeans_fast(X, m)
% Perform kmeans clustering.
% Input:
%   X: d x n data matrix
%   m: initialization parameter
% Output:
%   class: 1 x n sample classs
%   mu: d x k center of clusters
%   energy: optimization target value
% Written by Mo Chen (sth4nth@gmail.com).
class = init(X, m);
n = numel(class);
idx = 1:n;
last = zeros(1,n);
while any(class ~= last)
    [~,~,last(:)] = unique(class);                  % remove empty clusters
    mu = X*normalize(sparse(idx,last,1),1);         % compute cluster centers 
    [val,class] = min(dot(mu,mu,1)'/2-mu'*X,[],1);  % assign sample classs
end
energy = dot(X(:),X(:),1)+2*sum(val);

function class = init(X, m)
[d,n] = size(X);
if numel(m) == 1                           % random initialization
    mu = X(:,randperm(n,m));
    [~,class] = min(dot(mu,mu,1)'/2-mu'*X,[],1); 
elseif all(size(m) == [1,n])               % init with classs
    class = m;
elseif size(m,1) == d                      % init with seeds (centers)
    [~,class] = min(dot(m,m,1)'/2-m'*X,[],1); 
end
