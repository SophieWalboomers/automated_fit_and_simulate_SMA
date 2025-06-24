function x=hebbqual(p,v)
% p(1) = persistence factor mu
if v(1)>0.5 
    v1=1; 
elseif v(1)<=0.5
    v1=0;
end
if v(2)>0.5 
    v2=1; 
elseif v(2)<=0.5
    v2=0; 
end
x = v1*v2*(1-v(3))+p(1)*v(3);
end