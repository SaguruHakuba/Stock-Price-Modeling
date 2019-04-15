function [ t,P ] = sim_forward( t_sim, dt, P0, mu_dr, sig_dv )
%UNTITLED2 Summary of this function goes here
%   t_sim is the time of the simulation in days
%   dt is the time step in units of days
%   P0 is the initial price of the stock
%   mu_ar is the daily return
%   sig_av is the daily volitity

t = 0:dt:t_sim;
P = zeros(1,length(t));
P(1) = P0;

for ind = 1:length(t)-1
    P(ind+1) = P(ind)+mu_dr*P(ind)*dt+sig_dv*P(ind)*sqrt(dt)*randn(1);
end

end

