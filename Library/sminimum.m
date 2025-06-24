function x=sminimum(p,v)
% minimum of all elements of v divided by scaling factor p(1) which can be
% the min of the omega's 
%x = min(v)/p(1);
y=v(2);
x=min(v(1),v(2))/p(1);
end