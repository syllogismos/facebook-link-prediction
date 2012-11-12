
%
% this function calculates the closest nodes to the root node given the 
% parameters.. 
% 
% input:
% 	param: parameters, size(m,1) 
% 	features: feature matrix, size(n,n,m)
% 	d: binary vector representing the destination nodes, size(1,n)
% 	alpha: alpha value used in calculation of Q, size(1,1)
% 	y: number of nodes to output
% 
% output:
% 	nodes: output nodes, size(1,y)
% 	P: probabilities of the nodes, size(1,n)
%
%

function [nodes, P] = GetNodesFromParam(param, features,d,alpha = 0.2,y)

m = length(param); n = length(d);
J = 0; grad = zeros(1,m);
[A, dA] = FeaturesToEdgeStrength(features, param);
Q = EdgeStrengthToTransitionProbability(A, alpha);
% dQ = EdgeStrengthToPartialdiffTransition(A, dA, alpha);
% [P, dP] = ComputeStationaryP(Q, dQ);

epsilon = 1e-12;
  P = zeros(1,n);
  P += 1/n;
  t = 0;
  do
  	t += 1;
  	Pnew = P;
  	for i = 1:n
  	        Pnew(i) = P*Q(:,i);
  	end
	Pnew /= sum(Pnew);
  	temp = P; P = Pnew;
  until (Converged(P, temp, epsilon) || t>10000)
  
[pval, sortednodes] = sort(P);
nodes = sortednodes(n-y:n);


