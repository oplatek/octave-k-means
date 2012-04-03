function [ID,C]= k_means(X,C, plot2dStep = 0)
    % X input vectors as columns
    % ID is row vector of numbers 1..K, ith ID is number of cluster to which ith column form X belong
    % C is matrix where ith column is representing ith centroid
    %   - initial centroids are passed as arguments

    % K is number of desired clusters
    K = size(C,2);
    % T threshold
    T = 0.05;
    % number of input data
    n = size(X,2);

    % incorrect patameters parsing
    error_msg = "Usage k_means(X, K, [plot=1]) \n X input vectors as columns\n K is number of desired clusters";
 
    if nargin < 2 
        error(error_msg);    
    end
    if size(X,1) < 1
        error([error_msg, "\n X should contain some data!!!"]);
    end
    if n < K | K < 1
        error([error_msg, "\n You should supply atleast as many column vectors in X as many clusters K you want!!!"]); 
    end
      
    % program logic

    % init of ID: all vectors belong to the first cluster - it will change;)
    ID = ones(1, n);

    step = 0;
    prev_err = 0;
    err = 0;
    while(1)  
        step = step +1;
        % DISPLAY THE SITUATION
        if(plot2dStep != 0)
            centroids = C
            id = ID        
            step
            err
            prev_err
            plotStep(X,ID,C);
            pause(); 
        end

        % FINDING NEAREST CENTROID
        for j = 1:n
            % Find nearest centroid for X(:,j)
            min_i = 1;
            min_dist = distance(C(:,1),X(:,j)); 
            for i = 2:K
                d = distance(C(:,i), X(:,j));
                if ( d < min_dist )
                    min_dist = d;
                    min_i = i;
                end
            end
            % we update the centroids for each input vector as I promised;)
            ID(1,j) = min_i; 
        end
        
        % UPDATING CENTROIDS 
        prev_err = err;
        for i = 1:K
            % indexes to input vectors belonging to centroid i
            ID_i = find(ID == i);
            % compute centroidi i as expected value of input vectors belonging to i
            C(:,i) = sum(X(:,ID_i),2)/length(ID_i);
            err = sum( distance(X(:,ID_i), repmat(C(:,i),1,length(ID_i))) );
        end

        % TODO FINAL CONDITION
        % abs is because of first step
        if ( abs(prev_err - err) < T)
            break;
        end
    end
    if(plot2dStep != 0)
        err
        prev_err
        step
    end
end
