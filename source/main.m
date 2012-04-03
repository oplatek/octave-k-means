function [id, cen]= main(plotting = 0 )
    
    x = load('-ascii','quant.txt');
    % we use data as columns
    x = x';

    % Centroids are initialized as randomly chosen elements from input data
%    indData = randperm(size(x,2));
%    C = x(:,indData(1:3));

    
    % Centroids are initialized as randomly chosen elements from  square [1,1]*[1,1]
    C = rand(2,3);

    % returns vector of indexecs to centroid to which ith vector belongs and it also returns the centroids
    [id,cen] = k_means(x,C,plotting);

    
