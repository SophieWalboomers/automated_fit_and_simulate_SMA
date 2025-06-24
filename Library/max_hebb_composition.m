function  x=max_hebb_composition(p,v)
% p(1) is the persistence parameter for the hebbian function composed (with max) by the max operator;
% the hebbian function is applied to the first 3 values of v and the max function to the values v(4) to v(end)
x = composedbcfs(26,[1 1],[3 26],[p(1) 0 1 0], v, [3 length(v)-3]);
end
