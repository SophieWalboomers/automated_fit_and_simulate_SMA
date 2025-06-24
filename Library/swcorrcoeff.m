function x = swcorrcoeff(p,v)
% this function computes a sliding window variant of the Pearson correlation
% coefficient of two series
% p(1) = identification number of the state
% p(2) = length of window
% v(1) = entry of series 1
% v(2) = entry of series 2
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
    mean1=mean(ser1);                               % local shortnotation for means of series 1 and 2
    mean2=mean(ser2);
    devs1=ser1-mean1;                               % deviations vector for series 1 and 2
    devs2=ser2-mean2;                            
    sigma1=sqrt(sum(devs1.^2)/w);                   % standard deviation for series 1 and 2
    sigma2=sqrt(sum(devs2.^2)/w);                
    if sigma1*sigma2>0
        pcc=sum(devs1.*devs2/(sigma1*sigma2))/w;    % Pearson correlation coefficient for series 1 and 2
    elseif sigma1*sigma2<=0
        pcc=0;
    end
    x=abs(pcc);                                     % absolute correlation coefficient for series 1 and 2
elseif w<=0
    x=0
end
end

