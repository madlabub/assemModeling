function si = getPairwiseFact(roPrt, adjMat)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

NCls = length(roPrt);
si = cell(NCls, 1);
for c = 1 : NCls
    NPrt = size(adjMat{c,1},1);
%     ro = roPrt{c,1}.*edgeLowSim{c,1};
    ro = roPrt{c,1};
    si{c,1} = ones(size(ro));
    for j = 1 : NPrt
        for k = j+1 : NPrt
            Nj = sum(adjMat{c,1}(j,:));
            Nk = sum(adjMat{c,1}(k,:));
            fac1 = 0; fac2 = 0;
            if Nj ~= 0
%                 fac1 = sum(adjMat{c,1}(j,:).*ro(k,:))/Nj;
                fac1 = max(adjMat{c,1}(j,:).*ro(k,:));
            end
            if Nk ~= 0
%                 fac2 = sum(adjMat{c,1}(k,:).*ro(j,:))/Nk;
                fac2 = max(adjMat{c,1}(k,:).*ro(j,:));
            end
            si{c,1}(j,k) = 0.5*(fac1 + fac2);
%             si{c,1}(k,j) = si{c,1}(j,k);
        end
    end
end