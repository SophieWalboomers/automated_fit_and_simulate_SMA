function x = swami(p,v)
% this function computes a sliding window variant of the Pearson correlation
% coefficient of two series
% p(1) = identification number of the state
% p(2) = length of window
% v(1) = new entry for series 1
% v(2) = new entry for series 2
global sws1;
global sws2;
w=p(2);
if isnan(w)
    x=0;
elseif w==20
    sws1(p(1),3:w+1)=sws1(p(1),2:w);     % shift of series 1 and 2 window
    sws2(p(1),3:w+1)=sws2(p(1),2:w);      
    sws1(p(1),2)=v(1);                  % addition of new entry to series 1 and 2 sliding window
    sws2(p(1),2)=v(2);                       
    ser1=sws1(p(1),2:w+1);            % local shortnotation for sliding window series 1 and 2
    ser2=sws2(p(1),2:w+1);
    x = ami(ser1,ser2,0);              % average mutual information determination
elseif 0==0
    x=0;
end
end

