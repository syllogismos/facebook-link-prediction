% 
% this function takes as input edge strength matrix(A) and random restart 
% parameter(alpha) returns the transition probability matrix Q
% 
% 
% input:
%   A : edge strength matrix, size(n,n)
%   alpha: random restart parameter, size(1,1)
% output:
%   Q : transition probability matrix, size(n,n)
% 
% 

function Q = EdgeStrengthToTransitionProbability(A,alpha)
  
  n = length(A);
  rowsum = sum(A,2);
  normfactor = repmat(rowsum,1,n);
  normQ = A ./ normfactor;
  Q = (1-alpha)*normQ;
  Q(:, 1) += alpha*ones(n, 1);  % we are assumimng the source node s is 1..

end
