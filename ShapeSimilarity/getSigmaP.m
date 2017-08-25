function sigmaP = getSigmaP(distMat)

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

tau=5;

N = size(distMat,1);
sigmaP = zeros(N);
for i = 1 : N
    for j = i : N
        D = [distMat(i,:) distMat(j,:)];
        D(D == 0) = [];
        l = length(D);
        sD = sort(D);
        sigmaP(i,j) = sD(ceil(l*tau/100));
        sigmaP(j,i) = sigmaP(i,j);
    end
end