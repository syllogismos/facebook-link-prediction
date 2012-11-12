

% this function takes as input parameters, adjacency matrix of the network, lambda and alpha..
% 
% steps..
% 
% 1) We get edge strength matrix and its partial derivatives from features and parameters
% 2) We get transition probability and partial derivatives of it from A and dA
% 3) We get stationary probablities from Q and dQ
% 4) compute cost and gradient from the above variables..
% 
% input:
%   param: parameters of the edge strangth function, size(1,m)
%   features: features of all the edges in the network, size(n,n,m)
%   d: binary vector representing destination nodes, size(1,n)
%   lambda: regularization parameter, size(1,1)
%   alpha: random restart parameter, size(1,1)
% output:
%   J: loss, size(1,1)
%   grad: gradient of cst wrt parameters, size(1,m)
% 
% 

function [J, grad] = LossFunction(param, features, d,lambda=1,alpha=0.2,b=0.4)


% printf("lossfunction with param %f %f %f \n",param(1),param(2),param(3));
% param = param';
m = length(param); n = length(d);
J = 0; grad = zeros(1,m);
[A, dA] = FeaturesToEdgeStrength(features, param);
Q = EdgeStrengthToTransitionProbability(A, alpha);
dQ = EdgeStrengthToPartialdiffTransition(A, dA, alpha);
[P, dP] = ComputeStationaryP(Q, dQ);
[I, diff] = DifferenceIndices(P, d);
diff(diff<0) = 0;



wmvloss = wilcoxon(diff,b);
printf("lossfunction.m Calculating loss \n");
J = sum(param.^2) + lambda* sum(sum(wmvloss));  % loss is the h function
printf("lossfunction.m j = %f\n",J);
derivative = dwilcoxon(diff,wmvloss,b);

printf("lossfunction.m calculating grad\n");
for i = 1:m
	grad(i) += 2*param(i);
	temp = 0;
	for j = 1: size(I)(1)
		ind = I(j,:);
		temp += derivative(ind(1),ind(2)) * (dP(ind(1),i)-dP(ind(2),i));
	end
	grad(i) += temp*lambda;
end
grad = grad';
end
