% function x=alogistic_min(p,v)
% % p(1) = steepness sigma, p(2) = threshold tau, p(3) = min
% p2 = 1-p(2);
% y = (1/(1+exp(-p(1)*(sum(v)-p2)))-1/(1+exp(p(1)*p2)))*(1+exp(-p(1)*p(2)));
% z=max(0,y);
% x=1-z;
% end

function x = alogistic_inv(p, v)
% p(1) = steepness sigma, p(2) = threshold tau
s = sum(v);
base = 1 / (1 + exp(-p(1) * (s - p(2))));
norm_factor = 1 / (1 + exp(-p(1) * p(2)));
y = 1 - ((base - norm_factor) * (1 + exp(p(1) * p(2))));
x = min(1, y);
end