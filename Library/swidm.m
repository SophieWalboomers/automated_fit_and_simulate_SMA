function x = swidm(p,v)
% this function computes a sliding window variant of the Pearson correlation
% coefficient of two series
% p(1) = identification number of the state
% p(2) = length of window
% v(1) = new entry for series 1
% v(2) = new entry for series 2
global sws1;
global sws2;
w=p(2);
nser1(1:w)=0;
nser2(1:w)=0;
id1(1:w-1)=0;
id2(1:w-1)=0;
if w>0
    sws1(p(1),3:w+1)=sws1(p(1),2:w);              % shift of series 1 and 2 window
    sws2(p(1),3:w+1)=sws2(p(1),2:w);      
    sws1(p(1),2)=v(1);                             % addition of new entry to series 1 and 2 window
    sws2(p(1),2)=v(2);                       
    ser1=sws1(p(1),2:w+1);                             % local shortnotation for series 1 and 2
    ser2=sws2(p(1),2:w+1);
if std(ser1)>0
    nser1=(1+(ser1-mean(ser1))/std(ser1))/2 ;     % normalised ser1 
elseif std(ser1)<=0
    nser1=(ser1+0.5)-ser1;
end
if std(ser2)>0
    nser2=(1+(ser2-mean(ser2))/std(ser2))/2;      % normalised ser2 
elseif std(ser2)<=0
    nser2=(ser2+0.5)-ser2;
end
for i=1:w-1
    id1(i)=nser1(i+1)-nser1(i);     % intraseries differences
    id2(i)=nser2(i+1)-nser2(i);
end
    iddifferences=abs(id1-id2)     % absolute interseries differences between intraseries differences
    x = 1-3*mean(iddifferences) ;   % complementary value of average interseries differences
    elseif w<=0
        x=0;
 
end
if isnan(x)
    x=0;
end
end


