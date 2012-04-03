function  plotStep(X,ID,C)
    clf();
    hold on;
    scatter(X(1,:),X(2,:),[],ID)

    % range of ID is index to C
    % TODO +1 because of bug in gnuplot or octave
    ID_range = 1:(size(C,2)+1);
    scatter(C(1,:),C(2,:),16, ID_range)
    hold off;
end
