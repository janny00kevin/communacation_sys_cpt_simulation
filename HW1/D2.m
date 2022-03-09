% MATLAB script for Illustrative HW1.1
clear; clc; close all;

fs=50;                      % sampling frequency
ts=1/fs;                    % sampling interval
t=-6:ts:6;                  % time vector

x = (1).*(t/6<1/2).*(t/6>-1/2) + (1/2).*(t/6==1/2) + (1/2).*(t/6==-1/2);
%figure(1); plot(t,x),xlabel('time'),ylabel('x(t)')


X = fftshift(fft(x))/fs;
h = (exp(-10*t) + exp(-t.^2/2)).*(t<=4).*(t>=0);
H = fftshift(fft(h))/fs;

X_H = X.*H;
f = linspace(-fs/2,fs/2,length(x));

figure(5); plot(t,X_H),xlabel('freq'),ylabel('sys output')