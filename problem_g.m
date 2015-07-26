% (g) Form adaptive least mean squares (LMS) PSD estimates. Use model orders of 5, 15, and 30. Try three different adaptive step sizes.

clear all
close all
clc
load 'mydata'
set(0,'DefaultAxesFontSize',40);
set(0,'DefaultLineLinewidth',4);

N = 128;
FM = 4096;
fs = 64;
ws = 2*pi/(FM);

wnorm = -pi:ws:pi;
winnorm = wnorm(1:FM);
w = winnorm/(2*pi)*fs;

X = data1;
%% p =5
p = 5;
% order of the model


u = 0.001; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%%itnial =arburg(X(1:p+1),p)';
%%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end

n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);



[h v] = freqz(1,mya,FM,fs,'whole');


figure(1)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=5, u = 0.001', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.005; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');
n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);
figure(2)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=5, u = 0.005', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.01; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
% %itnial =arburg(X(1:p+1),p)';
% %a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end

mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');
n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);



figure(3)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=5, u = 0.01', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


%% p =15
p = 15;
% order of the model


u = 0.001; % order of the step
a = zeros(N,p); % N slots, p order



% % we need a inital condition
% %itnial =arburg(X(1:p+1),p)';
% %a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);



figure(4)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=15, u = 0.001', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.005; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
% %itnial =arburg(X(1:p+1),p)';
% %a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');
n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);

figure(5)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=15, u = 0.005', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.01; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
% %itnial =arburg(X(1:p+1),p)';
% %a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end

mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);


figure(6)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=15, u = 0.01', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


%% p =30
p = 30;
% order of the model


u = 0.001; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');
n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);




figure(7)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=30, u = 0.001', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.005; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);
figure(8)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=30, u = 0.005', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.01; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end

mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data1;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);


figure(9)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of unnoised data p=30, u = 0.01', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





%% noised data
X = data2;
%% p =5
p = 5;
% order of the model


u = 0.001; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');


n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);


figure(10)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=5, u = 0.001', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.005; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');
n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);

figure(11)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=5, u = 0.005', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.01; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end

mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);


figure(12)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=5, u = 0.01', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


%% p =15
p = 15;
% order of the model


u = 0.001; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);



figure(13)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=15, u = 0.001', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.005; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);
figure(14)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=15, u = 0.005', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.01; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end

mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');
n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);



figure(15)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=15, u = 0.01', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


%% p =30
p = 30;
% order of the model


u = 0.001; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);



figure(16)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=30, u = 0.001', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.005; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end


mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);
figure(17)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=30, u = 0.005', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



u = 0.01; % order of the step
a = zeros(N,p); % N slots, p order



% we need a inital condition
%itnial =arburg(X(1:p+1),p)';
%a(p,:) = itnial(2:end);

for n = p:N-1
    
    xtempe = X(n:-1:n-p+1);
    e = X(n+1)+xtempe'*a(n,:)';
    a(n+1,:) = a(n,:) - 2*u*e*xtempe';
end

mya=[1;a(N,:)'];

[h v] = freqz(1,mya,FM,fs,'whole');

n = p;
y = data2;
mya=[1;a(N,:)'];


y1=[y(n+1:N)];
Y1=toeplitz(y(n:N-1),y(n:-1:1).');

% compute the noise variance
sig2=norm(Y1*a(N,:)'+y1)^2/(N-n);


figure(18)
plot(w,db(abs(fftshift(h)).^2*sig2/N)/2);
title('Adaptive LMS PSD estimates of noised data p=30, u = 0.01', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;