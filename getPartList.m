function [clsObjPrt, stringName] = getPartList()

% -----------------
% ***INPUT***
% 
% -----------------

% -----------------
% ***OUTPUT***
% 
% prtObjCls:  Nx2 Matrix (N is the total number of parts)
%             first column represents global object number of the i-th row global part
%             second column represent class number of the i-th row global part
% objCls:     Mx1 Array (M is the total number of objects)
%             represents the class number of i-th row global object
% objPrt:     Mx1 Cell Array
%             each entry in i-th row is an array of global indices of parts in i-th global object
% clsObj:     Cx1 Cell Array (C is the total number of Class)
%             each entry in i-th row is an array of global indices of objects in i-th class
% prtFP:      Nx3 Matrix
%             first column represents the class number of i-th row global part
%             second column represents the local object number of i-th row global part
%             third column represents the local part number of the i-th row global part
% objFP:      Mx2 Matrix
%             first column represents the class number of i-th row global object
%             second column represents the local object number of the i-th row global object
% -----------------

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

dir = pwd; % Get path of current working directory
c = 1;
clsObjPrt = cell(0);
stringName = cell(0);
while exist([dir,'\Database\Class',num2str(c)],'dir')>0
    o = 1; n = 0;
    stringName{c,1} = [];
    while exist([dir,'\Database\Class',num2str(c),'\O',num2str(o),'.obj'], 'file')>0
        p = 1;
        clsObjPrt{c,1}{o,1} = [];
        while exist([dir,'\Database\Class',num2str(c),'\O',num2str(o),'P',num2str(p),'.obj'],'file')>0
            n = n + 1;
            clsObjPrt{c,1}{o,1}(end+1,1) = n;
            stringName{c,1}{n,1} = ['O',num2str(o),'P',num2str(p),'.obj'];
            p = p + 1;
        end
        o=o+1;
    end
    c=c+1;
end