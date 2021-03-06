clear ; close all; clc;

% parameters
N = 1000;             % length of random vector
n = 500;              % the times for estimate autocorrelation
M = 50;               % To compute Rx(0), Rx(1), ... , Rx(M)
Rx_av = zeros(1,1+M); % The average of Rx(0), Rx(1), ... , Rx(M)
% T = 1; % sample time

for j = 1:n
X = rand(1,N)-0.5;               % first, generate the i.i.d. uniform random vector, u(-0.5,0.5)
Rx = Rx_est(X,M);     % then calculate the estimated Rx
Rx_av = Rx_av + Rx;   % Average them over n sample paths
end

Rx_av = Rx_av/n;      % Average them over n sample paths
figure;
stem(0:M,Rx_av)

Sx = fftshift(abs(fft(Rx_av)));              % The Power Spectrum
figure;
plot(linspace(-0.5,0.5,M+1),abs(Sx)), axis([-inf,inf,0,0.2]);