function x = swsm(p,v)
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
    ser1=sws1(p(1),2:w+1);                             % local shortnotation for series 1 and 2
    ser2=sws2(p(1),2:w+1);
    av1=mean(ser1);        % averages 
    av2=mean(ser2);
    std1=std(ser1);        % standard deviations
    std2=std(ser2);
    if std1>0
    nser1=(1+(ser1-av1)/std1)/2;      % normalised ser1 
    elseif std1<=0
    nser1=(ser1+0.5)-ser1;
    end
    if std2>0
    nser2=(1+(ser2-av2)/std2)/2;      % normalised ser2 
    elseif std2<=0
    nser2=(ser2+0.5)-ser2;
    end
  x = 1-mean(abs(nser2-nser1));
elseif w<=0
  x=0;
end
end


