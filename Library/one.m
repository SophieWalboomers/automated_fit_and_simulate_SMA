% function x = stepmod(p,v)
% % p(1) = repeated time duration
% % p(2) = duration until value 1
%     global k;
%     global dt;
%     current = k*dt;
%     if      mod(current, p(1))<p(2)
%             x = 0;
%     elseif	mod(current, p(1))>=p(2)        
%             x = 1;
%     end
% end

function x = one(p, v)
    x=1;
end