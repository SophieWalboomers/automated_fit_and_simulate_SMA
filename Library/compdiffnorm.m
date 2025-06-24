function x=compdiffnorm(p,v)
% p(1) = identification number of the state
% v(1) and v(2) current values of the two series, 
% with values assumed in the [0,1] interval
global k;
global sumsseries1;
global sumsseries2;
sumsseries1(p(1))=sumsseries1(p(1))+v(1);	%  keeping track of sums up till now
sumsseries2(p(1))=sumsseries2(p(1))+v(2);
av1=sumsseries1(p(1))/k;        % averages up till now
av2=sumsseries2(p(1))/k;
if av1>0
    nv1=0.5*v(1)/av1;      % normalised values
elseif av1<=0
    nv1=0.5;
end
if av2>0
    nv2=0.5*v(2)/av2;       % normalised values
elseif av2<=0
    nv2=0.5;          
end
m=max(nv1,nv2);        % maximum of nv1 and nv2
if m>0
    x = 1-abs(nv1-nv2)/m;
elseif m<=0
    x = 0;
end