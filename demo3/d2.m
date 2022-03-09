clear ; close all; clc;

% parameters
N = 10000; % number of samples
f0 = 1000/pi; % carrier freq
T = 1; % sample period
M = 50; % To compute Rx(0), Rx(1), ... , Rx(M)

% WGN input
X1 = randn(1,N);
X2 = randn(1,N);

% use function "filter" to compute in-phase and quadrature component
Xc = filter(1,[1 -0.9],X1);
Xs = filter(1,[1 -0.9],X2);

% bandpass process
band_pass_process = Xc.*cos(2*pi*f0*T.*(1:N)) - Xs.*sin(2*pi*f0*T.*(1:N));

bpp_auto = Rx_est(band_pass_process,M); % autocorrelation of bandpass process
bpp_spe  = fftshift(abs(fft(bpp_auto))); % PSD of bandpass process

% plotting commands
figure; plot(linspace(-1/(2*T),1/(2*T),M+1),bpp_spe);