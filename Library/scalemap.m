function x=scalemap(p,v)
% This combination function maps activation values v(1)in a linear manner 
% from a [0, 1] scale onto a [p(1),p(2)] scale, so 0->p(1) and 1->p(2).
% p(1)= minimal activation value
% p(2)= maximal activation value. 
x = p(1)+v(1)*(p(2)-p(1));
end