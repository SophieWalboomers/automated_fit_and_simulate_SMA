function x = randsteponce(p,v)
% p(1) = start
% p(2) = end
    global k;
    global dt;
    if      k*dt >= p(1) && k*dt <= p(2)
            x = rand(1,1)
    elseif k*dt < p(1) || k*dt > p(2)
            x = 0
    end
end
