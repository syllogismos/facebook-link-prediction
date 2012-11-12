% 
% 
% This function takes as input edge strength matrix(A), partial derivatives 
% wrt to w of edge strength(dA) and alpha to return partial diff of 
% transition matrix(dQ)
% 
% input:
%   A: edge strength matrix, size(n,n)
%   dA: partial diff wrt parameters w of edge strength matrix, size(n,n,m)
%   alpha: random restart parameter, size(1,1)
% output:
%   dQ: partial derivatives of Q wrt parameters w, size(n,n,m)
% 
% 

function dQ = EdgeStrengthToPartialdiffTransition(A,dA,alpha)
  
  n = size(A)(1);
  if length(size(dA))==3 
	  m = size(dA)(3);
  else
	  m = 1;
  end
  dQ = zeros(n,n,m);
  sumU = sum(A,2); % sum of transition prob of all nodes starting from U
  den = sumU .^ 2;
  den = repmat(den,1,n);
  repsumU = repmat(sumU,1,n);
  for i = 1:m
	  sumdU = sum(dA(:,:,i),2); % sum of partial d of trans p of all nodes
	                            % starting from u
	  repsumdU = repmat(sumdU,1,n);
	  temp = (repsumU .* dA(:,:,i)) + (A .* repsumdU);
	  dQ(:,:,i) = temp ./ den;

  end

  dQ *= (1-alpha);

end
