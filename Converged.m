% 
% this function takes two arrays and retuns 1 if both the arrays are same 
% with in an given error margin..
% 

function ret = Converged(p1,p2,eps)

temp = max(abs(p1-p2));
if temp < eps
	ret = 1;
else
	ret = 0;
end

end
