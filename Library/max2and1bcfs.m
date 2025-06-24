function  x=max2and1bcfs(p,v)
% p(1) and p(2) are the numbers of the bcf's composed by the max operator;
% each of them has fixed parameters [1 1] and the first one takes 2 values and the second one takes 1 value.
x = composedbcfs(26,[1 1],p,[1 1 1 1], v, [2 1]);
end
