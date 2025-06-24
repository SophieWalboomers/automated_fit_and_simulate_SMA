function x=compdifflag1av(p,v)
% v(1) and v(2) current values of the two series
% this function uses a sliding window of two series to take into account
% time lags
% p(1) = identification number of the state
% p(2) = length w of window
% v(1) = entry of series 1
% v(2) = entry of series 2
global sws1;
global sws2;
w=p(2);
if w>0
    sws1(p(1),3:w+1)=sws1(p(1),2:w);     % shift of series 1 and 2 window
    sws2(p(1),3:w+1)=sws2(p(1),2:w);      
    sws1(p(1),2)=v(1);                   % addition of new entry to series 1 and 2 window
    sws2(p(1),2)=v(2);                       
    ser1=sws1(p(1),2:w+1);               % local shortnotation for series 1 and 2
    ser2=sws2(p(1),2:w+1);
end
% for f=1:w
%     for s:1:w
%         difflag(f,s)=abs(ser1(f),ser2(s))
%     end
% end
% diffmin=min(min(difflag(:,1:w)));
if w>0
    for lag=1:w
        if max(ser1(lag),ser2(1))>0
            diffterm(lag)=abs(ser1(lag)-ser2(1))/max(ser1(lag),ser2(1));
        elseif max(ser1(lag),ser2(1))<=0
            diffterm(lag)=0;
        end
    end
    x = 1-sum(diffterm)/w;
elseif w<=0
    x=0;
end