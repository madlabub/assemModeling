function [LFSim, LFDist] = getLFMat(clsObjPrt, useOldLFResult)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

if (~useOldLFResult)
    runLFCode(clsObjPrt);
end

curWD = pwd;

LFDist = cell(length(clsObjPrt),1);

cd([curWD, '/ShapeSimilarity/LFD/3DRetrieval_v1.8_Executable/Compare/'])

for c = 1 : length(clsObjPrt)
    for o1 = 1 : length(clsObjPrt{c,1})
        for n1 = 1 : length(clsObjPrt{c,1}{o1,1})
            p1 = clsObjPrt{c,1}{o1,1}(n1,1);
            for o2 = o1 : length(clsObjPrt{c,1})
                start_n2 = 1;
                if o1 == o2
                    start_n2 = n1+1;
                end
                for n2 = start_n2 : length(clsObjPrt{c,1}{o2,1})
                    p2 = clsObjPrt{c,1}{o2,1}(n2,1);
                    [~, str] = system(['GroundTruth_v1.86.exe ../../../../Database/Class',num2str(c),'/O', num2str(o1),'P', num2str(n1), ' ../../../../Database/Class',num2str(c),'/O', num2str(o2), 'P', num2str(n2)]);
                    LFDist{c,1}(p1,p2) = str2double(str);
                    LFDist{c,1}(p2,p1) = LFDist{c,1}(p1,p2);
                end
            end
        end
    end
    sigmaP = getSigmaP(LFDist{c,1});
    LFSim{c,1} = 1 + exp(-(LFDist{c,1}./sigmaP).^2);
%     I = 1 - eye(size(LFSim{c,1}));
%     LFSim{c,1} = LFSim{c,1}.*I;
end

cd(curWD)