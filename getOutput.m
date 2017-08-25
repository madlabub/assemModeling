clear all
close all
clc

% Copyright (C) 2016  Prakhar Jaiswal prakharj@buffalo.edu

load Database

% Array denoting the global indices of active parts in the interface workspace
inP = [2, 3, 7, 8];
inC = 1;

[Score, pList, nList] = getSuggestionList(inC, inP);