function x=posdev(p,v)
% gives deviation of v(1) from p(1) if v(1) >= p(1) else 0
if v(1) <= p(1)
    x=p(1)-v(1);
elseif v(1) > p(1)
    x = 0;
end