function x=sigmoid(p,v)
% p(1) = steepness sigma, p(2) = threshold tau
x = sum(v)^p(1)/(sum(v)^p(1)+p(2)^p(1));
end