% 
% 
% this function returns the wilcoxon loss function of each element in the input matrix
% 
%   diff = input matrix
%   b = wilcoxon parameter
% 
%   loss = output matrix




function loss = wilcoxon(diff, b)

loss = arrayfun(@sigmoid,diff/b);

end
