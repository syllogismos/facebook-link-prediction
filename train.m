clear; close all; clc;

rand("seed",3410);
% load data
printf("\n loading data\n");
load("Adj.mat");
load("initp.mat");
% get psi, d,
psi = FeaturesFromAdjacentMatrix(Adj);
n = size(psi,1);
m = size(psi,3);

% initial_w = zeros(1,m);

%initial_w = rand(1,m);

initial_w = w2;

d = Adj(1,:); d(x) = 1;
% calculate initial loss and graients with initial parameters

% [loss, grad] = LossFunction(initial_w, psi, d, lambda=1,alpha=0.2,b=0.4);

options = optimset('GradObj', 'on', 'MaxIter', 20);

% [w,loss] = ...
% 	fmincg(@(t)(LossFunction(t, psi, d, lambda=1,alpha=0.2,b=0.4)),
% 	initial_w, options);


