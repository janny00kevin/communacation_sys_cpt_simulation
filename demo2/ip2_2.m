clear ; clc; close all;
tic;
% MATLAB script for Illustrative Problem 2.2.

% 1

% 2-dimensioned random vector
n = 2e5;                               % Number of the generated samples
mx = [1;2];                            % mean of Gaussian random vector x
Cx = [1 0.5;0.5 1];                    % 2x2 covariance matrix of Gaussian random vector x
x = zeros(length(mx),n);
for i = 1:n
    y(:,i) = multi_gp([0;0],eye(2));   % n samples of y ~ N(0,[1 0;0 1])
end;
for j = 1:n
    x(:,j) = sqrtm(Cx)*y(:,j) + mx;
end;
figure;plot(y(1,:),y(2,:),'o');
figure;plot(x(1,:),x(2,:),'ro');

figure; histogram(x(1,:),100);         % histogram plot of random vector        


% 2

% Computation of the pdf of (x1,x2) follows.
 delta=0.05;
 x1=-5:delta:5;
 x2=-5:delta:5;
for i=1:length(x1),
   for j=1:length(x2),
       f(i,j)=(1/((2*pi)*det(Cx)^1/2))*exp((-1/2)*(([x1(i) x2(j)]-mx')/(Cx)*([x1(i);x2(j)]-mx))); 
   end;
end;
% Plotting command for pdf follows.
figure;mesh(x1,x2,f);
xlabel('x(1)'),ylabel('x(2)'),zlabel('pdf of x(t)');
toc;
