function nP = avgNumParts(clsObjPrt)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

nP = zeros(length(clsObjPrt), 1);
for c = 1 : length(clsObjPrt)
    nP(c) = ceil(clsObjPrt{c,1}{end,1}(end,1)/length(clsObjPrt{c,1}));
end