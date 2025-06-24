function x=compdiff(p,v)
% v(1) and v(2) current values of the two series
m=max(v(1),v(2));        % maximum of v(1) and v(2)
if m>0
    x = 1-abs(v(1)-v(2))/m;
elseif m<=0
    x = 0;
end