function x=dopamine(p,v)
% p(1) = amplitude scaling factor (controls wave strength)
% p(2) = baseline drop
% p(3) = threshold
% v(1) = phone stimulus
% 
% global k;
% global dt;
% persistent last_trigger_time; % Stores last time a trigger happened
% 
% if isempty(last_trigger_time)
%     last_trigger_time = -Inf;
% end
% 
% time = k*dt; % Get current system time
% 
% epsilon = 1e-3; % Small threshold to account for floating-point errors
% 
% if abs(v(1) - p(3)) < epsilon
%     last_trigger_time = time;
% end
% 
% 
% % Compute time since last trigger
% x_time = time - last_trigger_time;

% Compute wave-like fluctuation with fixed decay speed
wave = 0; % p(1) * (exp(-(x_time-1).^2) - exp(-(x_time - 5).^2));

% Final output: baseline + wave

% x = 0.5 - p(2) + wave;
x = 0;

end

