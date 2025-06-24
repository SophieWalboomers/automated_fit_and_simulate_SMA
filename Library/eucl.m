function x=eucl(p,v)
% p(1)= order n, p(2) = scaling factor lambda
y = (sum(v.^p(1))/p(2)).^(1/p(1));
x=max(y,0);
end