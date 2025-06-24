function x = scenario_generation(p,v)
% this function generates which 2 agents have for how long an interaction 
% with which modalities
% p(1) = identification number of the W-state for communication channel
% p(2) = max episode duration
% internal parameters:???? 
% internal variables:
% ca1   choice of agent 1
% ca2   choice of agent 2
% cmm   choice of modality movement
% cma   choice of modality affect
% cmv   choice of modality verbal
% dstart duration until start from last interaction
% dend   duration of interaction from start 
% ttlaststart totaltime of start last interaction
% ttlastend   totaltime of end last interactionas
global k;
global dt;
global communicationchannel;
global ttlaststart;
global ttlastend;
global recallk;
global ca1;
global ca2h;
global ca2;
global dstart;
global dend;
global cmm;
global cma;
global cmv;
global totaltime;
global j;

p(2)=50;

if k==1
   if j==278
   recallk=0;
   ttlastend=0;
   end
end

totaltime=(k-1)*dt;

if  k>recallk
    if totaltime==ttlastend 
    ca1 = round(0.5+4*rand(1,1));
    ca2h = round(-0.5+3*rand(1,1));
    ca2 = 1+mod(ca1+ca2h,4);
    cmm = round(0.4+0.6*rand(1,1));
    cma = round(0.4+0.6*rand(1,1));
    cmv = round(0.4+0.6*rand(1,1));
    dstart = round(p(2)*rand(1,1));
    dend = round(p(2)*rand(1,1));
    ttlaststart = totaltime + dstart;
    ttlastend = ttlaststart + dend;
    end
end
    recallk=k;
     
%%%%%%%% Assigning communication channels
    for i=1:36
        communicationchannel(i)=1;
    end
    if (1-ca1)*(1-ca2)==0
        for i=13:18
        communicationchannel(i)=0;
        end
        for i=22:27
        communicationchannel(i)=0;
        end
        for i=31:36
        communicationchannel(i)=0;
        end
    end
    if (2-ca1)*(2-ca2)==0
        for i=4:9
        communicationchannel(i)=0;
        end
        for i=19:21
        communicationchannel(i)=0;
        end
        for i=25:30
        communicationchannel(i)=0;
        end
        for i=34:36
        communicationchannel(i)=0;
        end
    end
    if (3-ca1)*(3-ca2)==0
        for i=1:3
        communicationchannel(i)=0;
        end
        for i=7:12
        communicationchannel(i)=0;
        end
        for i=16:18
        communicationchannel(i)=0;
        end
        for i=28:33
        communicationchannel(i)=0;
        end
    end
    if (4-ca1)*(4-ca2)==0
        for i=1:6
        communicationchannel(i)=0;
        end
        for i=10:15
        communicationchannel(i)=0;
        end
        for i=19:24
        communicationchannel(i)=0;
        end
    end
    if cmm==0
        for i=0:11
        communicationchannel(3*i+1)=0;
        end
    end
    if cma==0
        for i=0:11
        communicationchannel(3*i+2)=0;
        end
    end    
    if cmv==0
        for i=0:11
        communicationchannel(3*i+3)=0;
        end
    end       
%%%%%%%%

%%%%%%%%% Opening communication channels
if totaltime<ttlaststart
    x=0;
elseif totaltime>ttlastend
    x=0;
else 
    x=communicationchannel(p(1));
end  
%%%%%%%%%
end


