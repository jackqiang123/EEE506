%Form Burg (Harmonic) PSD estimates. Use model orders of 5, 15, and 30.
clear all
clc
load 'mydata';
set(0,'DefaultAxesFontSize',40);
set(0,'DefaultLineLinewidth',4);

N = 128;
FM = 4096;
fs = 64;
ws = 2*pi/(FM);

wnorm = -pi:ws:pi;
winnorm = wnorm(1:FM);
w = winnorm/(2*pi)*fs;

p = 5;
x =data1;


% Initialization
ef = x;
eb = x;
% Data type of 'a' should be the same as 'x' to enforce precision rules
a = 1; %#ok<*ZEROLIKE>

% Initial error
%E = dot(x,x)./N;

% Preallocate 'k' for speed.
% Data type of 'k' should be the same as 'x' to enforce precision rules
k = zeros(p, 1);
E = x'*x/N;
sig2 = 0;
for m=1:p
    % Calculate the next order reflection (parcor) coefficient
    efp = ef(2:end,:);
    ebp = eb(1:end-1,:);
    num = -2*ebp'*efp;
    den = efp'*efp+ebp'*ebp;
    
    k(m,:) = num ./ den;
    
    % Update the forward and backward prediction errors
    ef = efp + k(m,:)*ebp;
    eb = ebp + k(m,:)*efp;
    
    % Update the AR coeff.
    a=[a;zeros(1,1)] + k(m,:)*[zeros(1,1);conj(flipud(a))];
    
    % Update the prediction error
    E = (1 - conj(k(m,:))*k(m,:))*E;
  
end

[h v] = freqz(1,a,FM,fs,'whole');

figure(1)
plot(w,db(abs(fftshift(h)).^2/N*E)/2);
title('Burg PSD estimates of un-noised data of baised correlation and p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;







p = 15;
x =data1;


% Initialization
ef = x;
eb = x;
% Data type of 'a' should be the same as 'x' to enforce precision rules
a = 1; %#ok<*ZEROLIKE>

% Initial error
%E = dot(x,x)./N;

% Preallocate 'k' for speed.
% Data type of 'k' should be the same as 'x' to enforce precision rules
k = zeros(p, 1);
E = x'*x/N;
sig2 = 0;
for m=1:p
    % Calculate the next order reflection (parcor) coefficient
    efp = ef(2:end,:);
    ebp = eb(1:end-1,:);
    num = -2*ebp'*efp;
    den = efp'*efp+ebp'*ebp;
    
    k(m,:) = num ./ den;
    
    % Update the forward and backward prediction errors
    ef = efp + k(m,:)*ebp;
    eb = ebp + k(m,:)*efp;
    
    % Update the AR coeff.
    a=[a;zeros(1,1)] + k(m,:)*[zeros(1,1);conj(flipud(a))];
    
    % Update the prediction error
    E = (1 - conj(k(m,:))*k(m,:))*E;
  
end

[h v] = freqz(1,a,FM,fs,'whole');

figure(2)
plot(w,db(abs(fftshift(h)).^2/N*E)/2);
title('Burg PSD estimates of un-noised data of baised correlation and p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




p = 30;
x =data1;


% Initialization
ef = x;
eb = x;
% Data type of 'a' should be the same as 'x' to enforce precision rules
a = 1; %#ok<*ZEROLIKE>

% Initial error
%E = dot(x,x)./N;

% Preallocate 'k' for speed.
% Data type of 'k' should be the same as 'x' to enforce precision rules
k = zeros(p, 1);
E = x'*x/N;
sig2 = 0;
for m=1:p
    % Calculate the next order reflection (parcor) coefficient
    efp = ef(2:end,:);
    ebp = eb(1:end-1,:);
    num = -2*ebp'*efp;
    den = efp'*efp+ebp'*ebp;
    
    k(m,:) = num ./ den;
    
    % Update the forward and backward prediction errors
    ef = efp + k(m,:)*ebp;
    eb = ebp + k(m,:)*efp;
    
    % Update the AR coeff.
    a=[a;zeros(1,1)] + k(m,:)*[zeros(1,1);conj(flipud(a))];
    
    % Update the prediction error
    E = (1 - conj(k(m,:))*k(m,:))*E;
  
end

[h v] = freqz(1,a,FM,fs,'whole');

figure(3)
plot(w,db(abs(fftshift(h)).^2/N*E)/2);
title('Burg PSD estimates of un-noised data of baised correlation and p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


%% noised data
p = 5;
x =data2;


% Initialization
ef = x;
eb = x;
% Data type of 'a' should be the same as 'x' to enforce precision rules
a = 1; %#ok<*ZEROLIKE>

% Initial error
%E = dot(x,x)./N;

% Preallocate 'k' for speed.
% Data type of 'k' should be the same as 'x' to enforce precision rules
k = zeros(p, 1);
E = x'*x/N;
sig2 = 0;
for m=1:p
    % Calculate the next order reflection (parcor) coefficient
    efp = ef(2:end,:);
    ebp = eb(1:end-1,:);
    num = -2*ebp'*efp;
    den = efp'*efp+ebp'*ebp;
    
    k(m,:) = num ./ den;
    
    % Update the forward and backward prediction errors
    ef = efp + k(m,:)*ebp;
    eb = ebp + k(m,:)*efp;
    
    % Update the AR coeff.
    a=[a;zeros(1,1)] + k(m,:)*[zeros(1,1);conj(flipud(a))];
    
    % Update the prediction error
    E = (1 - conj(k(m,:))*k(m,:))*E;
  
end

[h v] = freqz(1,a,FM,fs,'whole');

figure(4)
plot(w,db(abs(fftshift(h)).^2/N*E)/2);
title('Burg PSD estimates of noised data of baised correlation and p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;







p = 15;
x =data2;


% Initialization
ef = x;
eb = x;
% Data type of 'a' should be the same as 'x' to enforce precision rules
a = 1; %#ok<*ZEROLIKE>

% Initial error
%E = dot(x,x)./N;

% Preallocate 'k' for speed.
% Data type of 'k' should be the same as 'x' to enforce precision rules
k = zeros(p, 1);
E = x'*x/N;
sig2 = 0;
for m=1:p
    % Calculate the next order reflection (parcor) coefficient
    efp = ef(2:end,:);
    ebp = eb(1:end-1,:);
    num = -2*ebp'*efp;
    den = efp'*efp+ebp'*ebp;
    
    k(m,:) = num ./ den;
    
    % Update the forward and backward prediction errors
    ef = efp + k(m,:)*ebp;
    eb = ebp + k(m,:)*efp;
    
    % Update the AR coeff.
    a=[a;zeros(1,1)] + k(m,:)*[zeros(1,1);conj(flipud(a))];
    
    % Update the prediction error
    E = (1 - conj(k(m,:))*k(m,:))*E;
  
end

[h v] = freqz(1,a,FM,fs,'whole');

figure(5)
plot(w,db(abs(fftshift(h)).^2/N*E)/2);
title('Burg PSD estimates of noised data of baised correlation and p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




p = 30;
x =data2;


% Initialization
ef = x;
eb = x;
% Data type of 'a' should be the same as 'x' to enforce precision rules
a = 1; %#ok<*ZEROLIKE>

% Initial error
%E = dot(x,x)./N;

% Preallocate 'k' for speed.
% Data type of 'k' should be the same as 'x' to enforce precision rules
k = zeros(p, 1);
E = x'*x/N;
sig2 = 0;
for m=1:p
    % Calculate the next order reflection (parcor) coefficient
    efp = ef(2:end,:);
    ebp = eb(1:end-1,:);
    num = -2*ebp'*efp;
    den = efp'*efp+ebp'*ebp;
    
    k(m,:) = num ./ den;
    
    % Update the forward and backward prediction errors
    ef = efp + k(m,:)*ebp;
    eb = ebp + k(m,:)*efp;
    
    % Update the AR coeff.
    a=[a;zeros(1,1)] + k(m,:)*[zeros(1,1);conj(flipud(a))];
    
    % Update the prediction error
    E = (1 - conj(k(m,:))*k(m,:))*E;
  
end

[h v] = freqz(1,a,FM,fs,'whole');

figure(6)
plot(w,db(abs(fftshift(h)).^2/N*E)/2);
title('Burg PSD estimates of noised data of baised correlation and p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;
