function x=custom_neg_hebb(p,v)
% p(1) = persistence factor mu

% x = v(3) - v(1)*v(2)*v(3) + (1- (p(1))) *(1-v(3));  % = W - v1v2W + (1-mu)*(1-W) = W - v1v2W + (1 - W -mu + mu W) 
                                                      % = 1 - v1v2W + (-mu + muW) = 1 - v1v2W - mu (1-W) 
x = 1 - v(1)*v(2)*v(3) - p(1)*(1-v(3));
end