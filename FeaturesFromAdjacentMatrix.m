% temporary function written to get features from adjacence matrix



function psi = FeaturesFromAdjacentMatrix(Adj)


% load('Adj.mat'); % directed graph, you can make it undirected graph if you can

temp1 = Adj;


for i = 1:396
 	for j = 1:396
 		if Adj(i,j) == 1
 			temp1(j,i) = temp1(i,j);
 		end
 	end
end

 temp2 = zeros(396,396);
 
 for i = 1:396
 	for j = i+1:396
 		if Adj(i,j) == 1
 			temp2(i,j) = temp2(j,i) = sum(Adj(i,:)==Adj(j,:));
 		end
 	end
 end

 temp2 = temp2/sum(sum(temp2));

temp3 = zeros(396,396);

for i = 1:396
	for j = i+1:396
		if Adj(i,j) == 1
			temp3(i,j) = temp3(j,i) = sum(Adj(i,:))+sum(Adj(j,:));
		end
	end
end
temp3 = temp3/(sum(sum(temp3)));

psi = zeros(396,396,3);
psi(:,:,1) = temp1;
psi(:,:,2) = temp3;
psi(:,:,3) = temp2;

end
