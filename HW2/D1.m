% MATLAB script for Illustrative HW2.1.
clear; clc; close all;

fs = 100;
ts = 1/fs;
t = -1:ts:11;

x = (2*sinc(20*t).*cos(2*pi*50*t) + sinc(20*t).^2.*cos(2*pi*130*t)).*(t>=0).*(t<=10);
z = hilbert(x);

figure
plot(t,real(z)); xlabel('time'); ylabel('hilbert of x(t)');

% (a)
figure
plot(t,imag(z)); xlabel('time'); ylabel('hilbert of x(t)');

% (b)
figure
plot(t,abs(z)); xlabel('time'); ylabel('envelope of x(t)');

% (c)
f0 = 85;
t2 = 0:ts:(length(x)-1)*ts;
x_low = z.*exp(-1i*2*pi*f0*t2);
figure;
subplot(1,2,1); plot(t,real(x_low)); title('In phase'); xlabel('time');     % In phase component
subplot(1,2,2); plot(t,imag(x_low)); title('Quadrature'); xlabel('time');   % Quadrature component
figure;
subplot(1,2,1); plot(t,real(z)); title('In phase'); xlabel('time');     % In phase component
subplot(1,2,2); plot(t,imag(z)); title('Quadrature'); xlabel('time');   % Quadrature component
