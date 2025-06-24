% for backup model
% function x = custom_stepmod(p, v)
% % p(1) = cycle length (repeated time duration)
% % p(2) = activation start time within the cycle
% % p(3) = activation end time within the cycle (must satisfy p(2) <= p(3) <= p(1))
%     global k;
%     global dt;
%     
%     time = k * dt; % Current simulation time
%     if time < 300 ||  time > 1200 
%         p1 = 120;
%     else
%         p1 = 20; 
%     end
%     mod_time = mod(time, p1); % Time within the cycle
% 
%     if (mod_time > p(2) && mod_time < p(3)) 
%         x = 1; % Activate within the specified interval
%     else
%         x = 0; % Explicitly set to zero outside the interval
%     end
% end


% New iteration
function x = custom_stepmod(p, v)
% p(1) = tau: tipping point between high and low frequency stimuli 
% p(2) = upsilon: threshold for externally activated stimuli
% p(3) = d: duration of each stimulus
% p(4) = interval 1 (small interval to simulate high frequency stimuli)
% p(5) = interval 2 (large interval to simulate low frequency stimuli)
% v(1) = trigger of frequent activations (beyond p(1))
    global k;
    global dt;    
    time = k * dt; 

    if (time < p(1)) || v(1) > p(2) % frequent activations
        interval = p(4);
    else 
        interval = p(5); % infrequent activations
    end
    
    mod_time = mod(time, interval); % Time within the cycle

    if (mod_time < p(3))  
        x = 1; % Activate within the specified interval
    else
        x = 0; % Explicitly set to zero outside the interval
    end
end


% function x = custom_stepmod(p, v)
% % p(1) = cycle length (repeated time duration)
% % p(2) = activation start time within the cycle
% % p(3) = activation end time within the cycle
% % p(4) = activation stop time (for optional extended interval)
%     global k;
%     global dt;
% 
%     time = k * dt; % Current simulation time
%     
%     if (time > p(1) && time < p(2)) || v(1) > 0.8
%         p1 = 20;
%         mod_time = mod(time, p1); % Only use mod in this case
% 
%         if (mod_time > p(3) && mod_time < p(4))  
%             x = 1; % Activate
%         else
%             x = 0; % Outside activation window
%         end
%     else
%         x = 0; % Stay at 0 otherwise, no mod applied
%     end
% end