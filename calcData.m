clear all
close all
clc

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

addpath(genpath(pwd)) % add all subfolders of the current working directory to MATLAB path

s = RandStream('mt19937ar','Seed',0);
RandStream.setGlobalStream(s);

% Thresholds
adjThrshld = 0.05;
adjNPoints = 500;
lowSimThrshld = 1.001;
highSimThrshld = 1.1;
useOldLFResult = false; %set true is LF results are pre-generated

[clsObjPrt, stringName] = getPartList();
avgNPrt = avgNumParts(clsObjPrt);
[adjMat, prtSzRatio] = getAdjNSz(clsObjPrt, adjThrshld, adjNPoints, avgNPrt);

[roPrt, LFDist] = getLFMat(clsObjPrt, useOldLFResult);
edgeLowSim = cell(length(clsObjPrt),1);
edgeHighSim = cell(length(clsObjPrt),1);
for i = 1 : length(clsObjPrt)
    edgeLowSim{i,1} = +(roPrt{i,1} > lowSimThrshld);
    edgeHighSim{i,1} = +(roPrt{i,1} > highSimThrshld);
end

[multiPrt, multiFac, setCard, setNum] = getMultiplicity(edgeHighSim, roPrt, clsObjPrt);

pairFac = getPairwiseFact(roPrt, adjMat);

clearvars i

% Save all data calcualted into a mat file
save('Database.mat')