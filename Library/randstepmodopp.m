function x = randstepmodopp(p,v)
% p(1) = repeated time duration
% p(2) = duration until value 1
% a = persistence factor
    global k;
    global dt;
    a=0;
    b=0.5;
    current = k*dt;
    if      mod(current, p(1))>=p(2)
            x = 0;
    elseif	mod(current, p(1))<p(2)        
            x = a*v(1)+(1-a)*(b+(1-b)*rand(1,1));
    end
end

