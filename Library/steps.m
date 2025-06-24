function x = steps(p,v)
% p(1) = start
% p(2) = end
    global k;
    global dt;
    current_timepoint = k*dt;
    
    if      current_timepoint < p(1) 
            x = 405;
    elseif   current_timepoint >= p(1) && current_timepoint <= p(2)  
            x = 380;
    elseif   current_timepoint >= p(2)
            x = 399;
    end 
end
