function x=slhomo(p,v)
% p(1) = amplification factor alpha, p(2) = tipping point tau
x = v(3)+p(1)*v(3)*(1-v(3))*(p(2)-abs(v(1)-v(2)));
end


% Bonding by homophily adaptation principle: the more similar v(1) and
% v(2), the stronger the connection
% Birds of a feather flock together
% 37:00 
% https://www.youtube.com/watch?v=bMh0Xwqkw6E&list=PLF-Ldc28P1zUjk49iRnXYk4R-Jm4lkv2b&index=5