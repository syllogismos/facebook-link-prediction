% 
% this function takes as input the stationary probability of the nodes and the destination node binary vector and returns the pairs of nodes for which (pl - pd) is positive and also the difference
% 
% input:
%   P: Stationanry probabilities, size(1,n)
%   d: destination nodes, size(1,n) binary vector
% 
% output:
%   I: pairs of nodes such as (no link node, destination node), size(x,2) x = no of pairs where pl > pd..
%   dd: difference matrix, size(n,n), dd(i,j) = P(i) - P(j)
% 
% 


function [I, dd] = DifferenceIndices(P,d)

n = length(P);
a = repmat(P',1,n);
b = repmat(P,n,1);

dd = a - b;

dd(find(d),:) = 0; dd(:,find(d==0)) = 0;
dd(1,:) = 0; dd(:,1) = 0;
[i,j] = find(dd>0);
I = [i,j];


end
