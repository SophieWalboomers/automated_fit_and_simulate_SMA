function x = swcompdiffnorm(p,v)
% this function computes a sliding window variant of the Pearson correlation
% coefficient of two series
% p(1) = identification number of the state
% p(2) = length of window
% v(1) = new entry for series 1
% v(2) = new entry for series 2
global sws1;
global sws2;
w=p(2);
if w>0
    sws1(p(1),3:w+1)=sws1(p(1),2:w);              % shift of series 1 and 2 window
    sws2(p(1),3:w+1)=sws2(p(1),2:w);      
    sws1(p(1),2)=v(1);                             % addition of new entry to series 1 and 2 window
    sws2(p(1),2)=v(2);                       
    av1=mean(sws1(p(1),2:w+1));       % averages                      
    av2=mean(sws2(p(1),2:w+1));
    std1=std(sws1(p(1),2:w+1));       % standard deviations                      
    std2=std(sws2(p(1),2:w+1));
if std1>0
    nv1=(1+(v(1)-av1)/std1)/2;      % normalised value for v(1) 
elseif std1<=0
    nv1=v(1);
end
if std2>0
    nv2=(1+(v(2)-av2)/std2)/2;      % normalised value for v(1) 
elseif std2<=0
    nv2=v(2);
end
m=max(nv1,nv2);        % maximum of normalised values nv1 and nv2
if m>0
    x = 1-abs(nv1-nv2)/m;
elseif m<=0
    x = 0;
    elseif w<=0
        x=0;
end
end
end

