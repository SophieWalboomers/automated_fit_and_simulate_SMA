function x = steponce(p,v)
% p(1) = start
% p(2) = end
    global k;
    global dt;
     
    if      k*dt >= p(1) && k*dt <= p(2)
            x = 1;
    else     
            x = 0;
    end
end
