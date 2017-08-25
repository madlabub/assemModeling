function A = getAdjMat(clsObjPrt, thrshld, nP, S)

% -----------------
% ***INPUT***
% 
% objFP:      Mx2 Matrix (M is the total number of objects)
%             first column represents the class number of i-th row global object
%             second column represents the local object number of the i-th row global object
% objPrt:     Mx1 Cell Array
%             each entry in i-th row is an array of global indices of parts in i-th global object
% prtFP:      Nx3 Matrix (N is the total number of parts)
%             first column represents the class number of i-th row global part
%             second column represents the local object number of i-th row global part
%             third column represents the local part number of the i-th row global part
% -----------------

% -----------------
% ***OUTPUT***
% 
% A:          NxN (symmetric)
%             Entry (i,j) represents adjacency between part i and part j
%             Values either 0 or 1, 1 means in contact
% -----------------

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

dir = pwd; % Get path of current working directory

% S=getSizeObj(clsObjPrt); % get size of all objects, used to set threshold value for contact analysis of its parts

% thrshld=0.05; % if the smallest distance between points on two parts are less than 5% object size, they are considered in contact
% nP=500; % Number of points to sample on each part

nCls = length(clsObjPrt);
A = cell(nCls,1);
for c = 1 : nCls
    nPrt = clsObjPrt{c,1}{end,1}(end,1);
    A{c,1} = zeros(nPrt, nPrt);
    for o = 1 : length(clsObjPrt{c,1});
%         objFile = [dir,'\Database\Class',num2str(c),'\O',num2str(o),'.obj'];
%         P = UniformSampling(objFile, nP); % sampling points on the object
%         [~, pcaP] = princomp(P); % aligning with principal components
%         mx = max(pcaP); % maximum coordinate along each principal component
%         mn = min(pcaP); % minimum coordinate along each principal component
%         S = norm(mx-mn); % length of the diagonal of bounding box
        for n1 = 1 : length(clsObjPrt{c,1}{o,1})
            filename1 = [dir,'\Database\Class',num2str(c),'\O',num2str(o),'P',num2str(n1),'.obj'];
            P1 = UniformSampling(filename1, nP); % sampling points on part p1
            for n2 = n1+1 : length(clsObjPrt{c,1}{o,1})
                filename2 = [dir,'\Database\Class',num2str(c),'\O',num2str(o),'P',num2str(n2),'.obj'];
                P2 = UniformSampling(filename2, nP); % sampling points on part p2
                dist = nan(nP,nP);
                for i = 1 : nP
                    for j = 1 : nP
                        dist(i,j) = norm(P1(i,:)-P2(j,:)); % distance between point i on part n1 and point j on part n2
                    end
                end
                mnDist = min(dist(:)); % getting minimum of all distances
                if mnDist < thrshld*S{c,1}(o,1) % setting 1 for part pairs with distance less than some threshold
                    p1 = clsObjPrt{c,1}{o,1}(n1,1);
                    p2 = clsObjPrt{c,1}{o,1}(n2,1);
                    A{c,1}(p1, p2) = 1;
                    A{c,1}(p2, p1) = 1;
                end
            end
        end
    end
end