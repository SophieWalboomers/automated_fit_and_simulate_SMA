function x=custom_ssum(p,v)
% p(1) = scaling factor
x = sum(v)/p(1);
x=max(0,x);
x=min(1,x);
end