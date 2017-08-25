function runLFCode(clsObjPrt)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

curWD = pwd;

fid = fopen([curWD, '/ShapeSimilarity/LFD/3DRetrieval_v1.8_Executable/Generator/list.txt'], 'wt');
for c = 1 : length(clsObjPrt)
    for o = 1 : length(clsObjPrt{c,1})
%         list = ['../../../../Database/O',num2str(o),'\n'];
%         fprintf(fid, list);
        for n = 1 : length(clsObjPrt{c,1}{o,1})
            list = ['../../../../Database/Class',num2str(c),'/O',num2str(o),'P',num2str(n),'\n'];
            fprintf(fid, list);
        end
    end
end

fclose(fid);

display('Please press ''n'' on cmd window to continue!');
display('And close it after the execution pauses!');
cd([curWD, '/ShapeSimilarity/LFD/3DRetrieval_v1.8_Executable/Generator/'])
system('3DAlignment_v1.8 <input.txt')

cd(curWD)