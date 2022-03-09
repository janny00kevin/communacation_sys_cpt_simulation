clear
clc
close all

ts = 0.001;
t = -2:ts:2;
x = sinc(100*t).*cos(2*pi*200*t);

% 1
figure;
plot(t,x); title('x(t) = sinc(100*t)*cos(2*pi*200*t)'); xlabel('time'); axis([-inf, inf, -0.8, 1]);
fs = 1/ts;
X = fftshift(fft(x))/fs;                             % freq response of x(t)
f = linspace(-fs/2,fs/2,length(x));           % frequency index
figure;
plot(f,abs(X)); title('X(f)'); xlabel('Frequency');

% 2
f0 = 200;
z = hilbert(x);                  % z(t) is the analytic signal of x(t)
t2 = 0:ts:(length(x)-1)*ts;
x_low = z.*exp(-1i*2*pi*f0*t2);                     % lowpass equivalent signal
X_low = fftshift(fft(x_low))/fs;                     % frequency response of x_low(t)
f = linspace(-fs/2,fs/2,length(x));       % frequency index  
figure;
plot(f,abs(X_low)); title('X_l_o_w(f)'); xlabel('Frequency');
figure;
subplot(1,2,1); plot(t,real(x_low)); title('In phase'); xlabel('time');     % In phase component
subplot(1,2,2); plot(t,imag(x_low)); title('Quadrature'); xlabel('time');   % Quadrature component
figure;
plot(t,abs(x_low)); title('Envelope'); xlabel('time');                      % Envelope

% 3
f0 = 100;
z = hilbert(x);                  % z(t) is the analytic signal of x(t)
t2 = 0:ts:(length(x)-1)*ts;
x_low = z.*exp(-1i*2*pi*f0*t2);                     % lowpass equivalent signal
X_low = fftshift(fft(x_low))/fs;                     % frequency response of x_low(t)
f = linspace(-fs/2,fs/2,length(x));       % frequency index  
figure;
plot(f,abs(X_low)); title('X_l_o_w(f)'); xlabel('Frequency');
figure;
subplot(1,2,1); plot(t,real(x_low)); title('In phase'); xlabel('time');     % In phase component
subplot(1,2,2); plot(t,imag(x_low)); title('Quadrature'); xlabel('time');   % Quadrature component
figure;
plot(t,abs(x_low)); title('Envelope'); xlabel('time');                    % Envelope
