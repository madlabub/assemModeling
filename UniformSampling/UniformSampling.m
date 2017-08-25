function P=UniformSampling(filename,N)

% -----------------
% ***INPUT***
% 
% filename:   String
%             Path of the obj file
% N:          Integer
%             Number of points to sample
% -----------------

% -----------------
% ***OUTPUT***
% 
% P:          Nx3 Matrix
%             Each row represents coordinates of one sampled point on the object/part
% -----------------

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

[vertex,faces]=read_obj(filename);

face_num=size(faces,2); % number of faces

% Calculation of area of faces for sampling
for i=1:face_num
    t=faces(:,i);
    tcorr=vertex(:,t); % coordinates of all three vertices of i-th face
    u=tcorr(:,2)-tcorr(:,1); % vector joining vertex 1 to vertex 2
    v=tcorr(:,3)-tcorr(:,1); % vector joining vertex 1 to vertex 3
    area(i)=0.5*norm(cross(u,v)); % area of i-th face
end

% Sampling uniformly distributed points
P=sampling(vertex,faces,area,N)';