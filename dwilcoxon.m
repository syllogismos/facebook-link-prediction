% this function takes a matrix and its wilcoxon loss of each element and b, to give derivative
% 
% 
%   wilcox function = sigmoid(x/b);
%   derivative = (sigmoid(x/b)*(1-sigmoid(x/b)))/b
% 
%   diff = input matrix
%   wmvloss = wilcoxon(diff,b)
%   b = hyper parameter
% 
%   der = derivative according to the above formula
% 



function der = dwilcoxon(diff, wmvloss, b)

temp = 1 - wmvloss;

der = wmvloss .* temp;
der /= b;

end
