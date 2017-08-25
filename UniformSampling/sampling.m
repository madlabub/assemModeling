function P=sampling(vertices,faces,area,N)

% -----------------
% ***INPUT***
% 
% vertices:   3xV (V is number of vertices)
%             Each column represents coordinates of one vertex
% faces:      3xF (F is number of faces)
%             Each column represents indices of vertices forming a face
% area:       1xF Array
%             Each entry represents are of cooresponding face
% N:          Integer
%             Number of points to sample
% -----------------

% -----------------
% ***OUTPUT***
% 
% P:          3xN Matrix
%             Each column represents on sampled point on the object/part
% -----------------

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

ca=cumsum(area); % Cumulative sum of area in an array
total_area=ca(end);
f=size(faces,2);

for i=1:N
    % Choosing face based on area of faces
    r=rand;
    ra=r*total_area; % random number between 0 and total_area
    
    % choosing a face based on random number ra
    m=1;n=f;
    while(abs(n-m)>2)
        j=m+round((n-m)/2);
        if ca(j)>=ra
            n=j;
        else
            m=j;
        end
    end
    if ra<=ca(n-1)
        if ra<=ca(m)
            n=m;
        else
            n=n-1;
        end
    end
    
    t=faces(:,n);
    % A,B,C are the coordinates of three vertices of n-th the face
    A=vertices(:,t(1));
    B=vertices(:,t(2));
    C=vertices(:,t(3));
    
    r1=rand;r2=rand;
    P(:,i)=(1-sqrt(r1))*A+sqrt(r1)*(1-r2)*B+sqrt(r1)*r2*C; % Based on paper "Shape Distributions", Osada et al.
end