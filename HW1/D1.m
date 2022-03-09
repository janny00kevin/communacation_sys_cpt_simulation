% MATLAB script for Illustrative HW1.2
clear; clc; close all;

fs = 350;                     % sampling frequency
ts = 1/fs;                    % sampling interval
t = -5:ts:5;                  % time vector
T = 0.01;

% 1.(a)
x = sinc(t/T).^2;
f = linspace(-fs/2,fs/2,length(x)); % freq index
figure(1); plot(t,x),xlabel('time'),ylabel('x(t)'),title('T=1/100, fs=350')

X = fftshift(fft(x))/fs; % Fourier transform of x(t)
figure(2); plot(f,abs(X)),xlabel('freq'),ylabel('|X(f)|'),title('T=1/100, fs=350')
figure(3); plot(f,phase(X)),xlabel('freq'),ylabel('∠X(f)'),title('T=1/100, fs=350')

% 1.(b)
T = 1/150;
x = sinc(t/T).^2;
f = linspace(-fs/2,fs/2,length(x)); % freq index
figure(4); plot(t,x),xlabel('time'),ylabel('x(t)'),title('T=1/150, fs=350')

X = fftshift(fft(x))/fs; % Fourier transform of x(t)
figure(5); plot(f,abs(X)),xlabel('freq'),ylabel('|X(f)|'),title('T=1/150, fs=350')
figure(6); plot(f,angle(X)),xlabel('freq'),ylabel('∠X(f)'),title('T=1/150, fs=350')

% 1.(c)
T = 1/100;
fs = 50;
ts = 1/fs; 
t = -5:ts:5;
x = sinc(t/T).^2;
f = linspace(-fs/2,fs/2,length(x)); % freq index
figure(7); plot(t,x),xlabel('time'),ylabel('x(t)'),title('T=1/100, fs=50')

X = fftshift(fft(x))/fs; % Fourier transform of x(t)
figure(8); plot(f,abs(X)),xlabel('freq'),ylabel('|X(f)|'),title('T=1/100, fs=50')
figure(9); plot(f,angle(X)),xlabel('freq'),ylabel('∠X(f)'),title('T=1/100, fs=50')