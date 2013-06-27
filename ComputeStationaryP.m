% 
% This function computes stationary probability(P) and (dP) of each node given 
% transition probability matrix(Q) and partial derivatives of trantition 
% matrix(dQ)
% 
% input:
%   Q: transiton probability matrix, size(n,n)
%   dQ: partial derivatives of Q wrt parameters, size(n,n,m)
% output:
%   P: stationary distribution of nodes, size(1,n)
%   dP: partial derivatives of P, size(n,m)
%


function [P, dP] = ComputeStationaryP(Q, dQ)
  
	epsilon = 1e-12;
  	n = length(Q);
  	if length(size(dQ))==3 
  	        m = size(dQ)(3);
  	else
  	        m = 1;
  	end
  	P = zeros(1,n);
  	dP = zeros(n,m);
  	P += 1/n;
  	t = 0;
  	printf("computestationaryp.m calculating P\n");

  	do
  		t += 1;
  		Pnew = P;
  		for i = 1:n
  		        Pnew(i) = P*Q(:,i);
  		end
  	      Pnew /= sum(Pnew);
  		temp = P; P = Pnew;
  	until (Converged(P, temp, epsilon) || t>100)
  	

  	printf("computestationaryp.m calculating dP\n");
  	for j = 1:m
  	        k = 0;
  	        dQj = dQ(:,:,j);
  	        do
  	        k += 1;
  	        dpjnew = dP(:,j);
  	        for i = 1:n
  	      	  dpjnew(i) = (Q(:,i)' * dP(:,j)) + (P * dQj(:,i));
  	        end
  	        temp = dP(:,j); dP(:,j) = dpjnew;
  	        until (Converged(dP(:,j), temp, epsilon) || k>100)
  	end

end
