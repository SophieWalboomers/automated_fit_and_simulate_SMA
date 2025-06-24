function x=hebbneg(p,v)
% p(1) = persistence factor mu
% v(1) = state value of source state
% v(2) = state value of destination state
% v(3) = value of W-state
x = -v(1)*(1-v(2))*(1+v(3))+p(1)*v(3);
end