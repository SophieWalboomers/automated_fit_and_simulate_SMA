function x=maxmin3(p,v)
% maximum of minima of up to three subsets of v
if p(1)+p(2)<length(v)
x = max([min(v(1:p(1))), min(v(p(1)+1:p(1)+p(2))), min(v(p(1)+p(2)+1:end))]);
elseif p(1)<length(v)
x = max([min(v(1:p(1))), min(v(p(1)+1:p(1)+p(2)))]);
elseif p(1)==length(v)
x = min(v);
end