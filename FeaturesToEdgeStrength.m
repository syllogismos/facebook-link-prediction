% this function takes into input the parameter of the edge strength function, 
% and features of edges and gives edge strength and its partial derivative wrt 
% to each parameter..
% future implementations include varying the edge strength function as well..
% n = number of nodes in the network, m is the number of features 
%

% input:
%   psi: features of each edge, size(n,n,m)
%   w  : parameters of the edge strength function, size(1,m)
% output:
%   A : edge strength matrix, size(n,n)
%   dA: partial derivative wrt to w, size(n,n,m)
 

function [A,dA] = FeaturesToEdgeStrength(psi, w)

n = size(psi,1);
m = length(w);

A = zeros(n,n); dA = zeros(n,n,m);

wmatrix = ones(n,n,m);
for i = 1:m
	wmatrix(:,:,i) *= w(i);
end

A = wilcoxon(sum((psi .* wmatrix),3),1);

temp = A .* (1-A);

for i = 1:m
	dA(:,:,i) = temp;
end

dA = dA .* wmatrix;



end
