function x=transdetav(p,v)
% v(1) current value of the monitored series
% p(1) = identification number of the state
% p(2) = length w of window
global sws1;
w=p(2);
if w>0
    sws1(p(1),3:2*w+1)=sws1(p(1),2:2*w);     % shift of series 1 window    
    sws1(p(1),2)=v(1);                   % addition of new entry to series 1 window                  
    ser1=sws1(p(1),2:2*w+1);               % local shortnotation for series 1 
    m1=mean(ser1(w+1:2*w));
    m2=mean(ser1(1:w));
    x=m2-m1;
elseif w<=0
    x=0;
end