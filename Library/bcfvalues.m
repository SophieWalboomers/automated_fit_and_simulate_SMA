function  x=bcfvalues(nrs, ps, vs, ks)
for n=1:length(nrs)
p = ps(2*n-1:2*n);
if n==1
    v = vs(1:ks(1));
elseif n>1
    v = vs(sum(ks(1:n-1))+1: sum(ks(1:n)));
end
x(n)= bcf(nrs(n), p, v);
end
