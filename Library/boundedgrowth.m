function x=boundedgrowth(p,v)
% growth of a population bounded by carrying capacity p(1)
x = (2-sum(v)/p(1))*sum(v);
end