function x=ssumpeak(p,v)
% p(1) = scaling factor
% p(2) = peak position
x = (ssum(p(1),v)/p(2))^(p(2)/(1-p(2)))*(1-ssum(p(1),v))/(1-p(2));
end