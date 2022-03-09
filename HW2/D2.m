% MATLAB script for Illustrative HW2.2.
clear; clc; close all;

n = 2e7;
u = rand(n,1);

% (a)
figure;
histogram(u,500);

% (b)
x_m = 2.5;
alpha = 1.25;
pareto = x_m./(1-u).^(1/alpha);
figure;
histogram(pareto,500); ylabel('Pareto distribution'); % xlim([0 20]); ylim([0 20])

% (c)
x_1 = randn(n,1);
x_2 = randn(n,1);
cauchy = x_1./x_2;
figure;
histogram(cauchy,500    ); ylabel('Cauchy distribution');

% (d)
k = randn(n,10);
chi = zeros(n,1);
for i=1:length(k)           			
  chi(i)=k(i)*k(i)';      			
end
figure;
histogram(chi,500); ylabel('Cauchy distribution')



