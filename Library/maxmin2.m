function x=maxmin2(p,v)
% maximum of minima of up to two subsets of v
if p(1)<length(v)
x = max([min(v(1:p(1))), min(v(p(1)+1:end))]);
elseif p(1)==length(v)
x = min(v);
end