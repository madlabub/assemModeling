function PScore = getPscore(pairSi, multiSi, multiSet, fixSet, varSet, isMarg, setCardCls, setNumCls)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

% maxRo = 1 + 2;

sz = size(varSet);
PScore = ones(sz(1),1);

if isMarg == 1
    powNo = zeros(sz(1), 1);
%     m = cell(length(multiSet),1);
    for i = 1 : length(multiSet)
        for j = 1 : size(multiSet{i,1}, 1)
%             m{i,1}(j,1) = length(fixSet) - length(MY_setdiff(fixSet, multiSet{i,1}(j,:)));
            powNo(multiSet{i,1}(j,:)) = length(fixSet) - length(MY_setdiff(fixSet, multiSet{i,1}(j,:)));
        end
    end
    powNo(powNo>=setCardCls) = 0;
end

for i = 1:sz(1)
    
    pSet = [fixSet, varSet(i,:)];
    PScore(i,1) = PScore(i,1)*prod(prod(pairSi(pSet, pSet)));
    
%     if isMarg == 1 && setCardCls(varSet(i,:),1) > 0
%         sL = setCardCls(varSet(i,:),1);
%         rIdx = setNumCls(varSet(i,:),1);
%         powNo = m{sL,1}(rIdx,1);
%         if powNo < sL && powNo > 0
% %             PScore(i,1) = PScore(i,1)*(multiSi{sL,1}(rIdx,1)^powNo);
%             PScore(i,1) = PScore(i,1)*(multiSi(varSet(i,:),1)^powNo);
%         end
%     end
end

if isMarg == 1
    PScore = PScore.*((multiSi.^powNo).^0.5);
end