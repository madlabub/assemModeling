function [FinalScore, pList, nameList] = getSuggestionList(inC, inP)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

% load the pre-calculated data from database
load Database

inP(inP == 0) = [];

if isempty(inP)
    
    Score = [];
    for i = 1 : length(clsObjPrt{inC,1})
        Score = [Score; prtSzRatio{inC,1}{i,1}];
    end
    
else
    
    if size(inP,1) > 1
        inP = inP';
    end
    
%     ro = roPrt{inC,1};
    pairSi = pairFac{inC,1};
    multiSi = multiFac{inC,1};
    multiSet = multiPrt{inC,1};
    setCardCls = setCard{inC,1};
    setNumCls = setNum{inC,1};

    nVarPrt = min(2, max(1, avgNPrt(inC) - length(inP) - 1));
    nPrt = clsObjPrt{inC,1}{end,1}(end,1);

    combs = npermutek(1:nPrt, nVarPrt);

    isMarg = 0;
    PScoreComb = getPscore(pairSi, multiSi, multiSet, inP, combs, isMarg, setCardCls, setNumCls);

%     Score = zeros(nPrt,1);
%     idxBand = nPrt^nVarPrt; idx = 0;
%     for  i = 1:nPrt
%         Score(i,1) = Score(i,1) + sum(EdgeComb(idx+1:idx+idxBand,1).*log(1+PScoreComb(idx+1:idx+idxBand,1)));
%         idx = idx + idxBand;
%     end

    Score = zeros(nPrt,1);
    varSet = (1:nPrt)';
    isMarg = 1;
    for  i = 1 : size(combs,1)
        fixSet = [inP, combs(i,:)];
        P = getPscore(pairSi, multiSi, multiSet, fixSet, varSet, isMarg, setCardCls, setNumCls);
        PScore = P*PScoreComb(i,1);
        Score = Score + (PScore);
    end
    
end
    
[FinalScore, pList] = sort(Score,'descend');

nameList = stringName{inC,1}(pList,1);