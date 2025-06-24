function x = stepmodbounded(p,v)
% p(1) = repeated time duration (rho)
% p(2) = duration until value 1 (delta)
    global k;
    global dt;
    current = k*dt;
    if      mod(current, p(1))<p(2)
            x = 0;
    elseif	mod(current, p(1))>=p(2) & current<10000%timebound       
            x = 1;
    elseif	mod(current, p(1))>=p(2) & current>=10000%timebound       
            x = 0;
    end
end

