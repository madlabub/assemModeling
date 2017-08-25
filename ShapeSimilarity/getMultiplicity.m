function [multiPrt, multiFac, setCard, setNum] = getMultiplicity(edgeHighSim, roPrt, clsObjPrt)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

multiPrt = cell(length(clsObjPrt), 1);
multiFac = cell(length(clsObjPrt), 1);
setCard = cell(length(clsObjPrt), 1);
setNum = cell(length(clsObjPrt), 1);
for c = 1 : length(clsObjPrt)
    setCard{c,1} = zeros(clsObjPrt{c,1}{end,1}(end,1), 1);
    setNum{c,1} = setCard{c,1};
    multiFac{c,1} = setCard{c,1};
    for o = 1 : length(clsObjPrt{c,1})
        idx = clsObjPrt{c,1}{o,1};
        subMat = triu(edgeHighSim{c,1}(idx,idx), 1);
        isTaken = zeros(length(idx),1);
        for i = 1 : length(idx)
            if isTaken(i) == 0
                rowSubMat = subMat(i,:);
                simPrt = find(rowSubMat == 1);
                if ~isempty(simPrt)
                    prtSet = idx([i, simPrt]);
                    szSet = length(prtSet);
                    if length(multiPrt{c,1}) < szSet
                        multiPrt{c,1}{szSet, 1} = [];
%                         multiFac{c,1}{szSet, 1} = [];
                    end
                    multiPrt{c,1}{szSet, 1}(end+1,:) = prtSet;
                    setCard{c,1}(prtSet,1) = szSet;
                    setNum{c,1}(prtSet,1) = size(multiPrt{c,1}{szSet,1}, 1);
                    isTaken(simPrt) = 1;
                    fact = 1; count = 0;
                    for j = 1 : szSet
                        for k = j+1 : szSet
                            fact = fact+roPrt{c,1}(prtSet(j),prtSet(k));
                            count = count+1;
                        end
                    end
%                     multiFac{c,1}{szSet, 1}(end+1,:) = fact/count;
                    multiFac{c,1}(prtSet,1) = fact/count;
                end
            end
        end
    end
end