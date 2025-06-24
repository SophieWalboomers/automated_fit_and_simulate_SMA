function x=dope(p,v)
% p(1) = amplitude scaling factor (controls wave strength)
% p(2) = baseline drop
% p(3) = threshold
global k;
global dt;
persistent last_trigger_time baseline_drop; % Stores last time a trigger happened

if isempty(last_trigger_time)
    last_trigger_time = -Inf;
end
if isempty(baseline_drop)
    baseline_drop=0;
end

time = k*dt; % Get current system time

epsilon = 1e-3; % Small threshold to account for floating-point errors

if abs(v(1) - p(3)) < epsilon
    last_trigger_time = time;
    baseline_drop = p(2);
end


% Compute time since last trigger
x_time = time - last_trigger_time;

% Compute wave-like fluctuation with fixed decay speed
wave = p(1) * (exp(-(x_time-1).^2) - exp(-(x_time - 5).^2));

% Final output: baseline + wave

x = 0.5 - (0.5*baseline_drop) + wave;
end

