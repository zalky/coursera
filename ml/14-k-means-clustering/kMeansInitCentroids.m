function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly

centroids = zeros(K, size(X, 2));

## randomize indices from 1 to size(X, 1)
randidx = randperm(size(X, 1));
## Take first K samples as centroids
centroids = X(randidx(1:K), :);

end

