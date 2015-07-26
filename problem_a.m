%Form Blackman-Tukey PSD estimates with lags of 10 and 20.
%Use a Hamming window and unbiased correlation estimates.2
clear all
load 'mydata'

N = 128;
FM = 4096;
fs = 64;
ws = 2*pi/(FM);

wnorm = -pi:ws:pi;
winnorm = wnorm(1:FM);
w = winnorm/(2*pi)*fs;


set(0,'DefaultAxesFontSize',40);
set(0,'DefaultLineLinewidth',4);

L = 10;


% this is the setting

r_unbaised = xcorr(data1,'unbiased');

r = r_unbaised(N:N+L-1);           % get r(0) to r(M) only

ham = hamming(2*L);
ham = ham(L+1:end);

r = r.*ham; % this is only a single side transfer. we need two size, so times 2.
X = 2*fft(r,FM)/size(r,1);
figure(1);
plot(w, db(abs(fftshift(X)))/2);

title('Blackman-Turkey PSD estimate of un-noised data with lags 10 of Hamming', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



% L = 20;
%

L = 20;
r_unbaised = xcorr(data1,'unbiased');

r=r_unbaised(N:N+L-1);           % get r(0) to r(M) only

ham = hamming(2*L);
ham = ham(L+1:end);

r = r.*ham;
X = 2*fft(r,FM)/size(r,1);
figure(2);
plot(w, db(abs(fftshift(X)))/2);
title('Blackman-Turkey PSD estimate of un-noised data with lags 20 of Hamming', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;









%% noised data


N = 128;
FM = 4096;
fs = 64;
ws = 2*pi/(FM);

wnorm = -pi:ws:pi;
winnorm = wnorm(1:FM);
w = winnorm/(2*pi)*fs;



L = 10;


% this is the setting

r_unbaised = xcorr(data2,'unbiased');

r = r_unbaised(N:N+L-1);           % get r(0) to r(M) only

ham = hamming(2*L);
ham = ham(L+1:end);

r = r.*ham; % this is only a single side transfer. we need two size, so times 2.
X = 2*fft(r,FM)/size(r,1);
figure(3);
plot(w, db(abs(fftshift(X)))/2);
title('Blackman-Turkey PSD estimate of noised data with lags 10 of Hamming', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



% L = 20;
%

L = 20;
r_unbaised = xcorr(data2,'unbiased');

r=r_unbaised(N:N+L-1);           % get r(0) to r(M) only

ham = hamming(2*L);
ham = ham(L+1:end);

r = r.*ham;
X = 2*fft(r,FM)/size(r,1);
figure(4);
plot(w, db(abs(fftshift(X)))/2);
title('Blackman-Turkey PSD estimate of noised data with lags 20 of Hamming', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



