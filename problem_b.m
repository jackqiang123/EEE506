% %Form Welch Periodogram PSD estimates. 
% If N samples are divided into P segments of D samples each, with a shift of S samples between adjacent segments,
% let S = 10 and 20, and let D = 32. Use a Hamming window.
clear all
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

D = 32;

ham = hamming(D);

windowpower = ham'*ham;
     % the power of the window vector v


% s = 20
S = 10; 
numberofsegment = fix((N-D+S)/S); % number of subsamples


power=zeros(FM,1);

for i = 1 : numberofsegment
   y = data1((i-1)*S+1:(i-1)*S+D);
   
   power= power + (abs(fft((y(1:D).*ham(:)),FM)/D).^2);

end

power=power/numberofsegment/windowpower*fs;

figure(1);
plot(w,db(fftshift(power))/2);
title('Welch PSD estimate of un-noised data with S = 10', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





% s = 210
S = 20; 
numberofsegment = fix((N-D+S)/S); % number of subsamples


power=zeros(FM,1);

for i = 1 : numberofsegment
   y = data1((i-1)*S+1:(i-1)*S+D);
   
   power= power + (abs(fft((y(1:D).*ham(:)),FM)/D).^2);

end

power=power/numberofsegment/windowpower*fs;

figure(2);
plot(w,db(fftshift(power))/2);
title('Welch PSD estimate of un-noised data with S = 20', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



%% noised 

S = 10; 
numberofsegment = fix((N-D+S)/S); % number of subsamples


power=zeros(FM,1);

for i = 1 : numberofsegment
   y = data2((i-1)*S+1:(i-1)*S+D);
   
   power= power + (abs(fft((y(1:D).*ham(:)),FM)/D).^2);

end

power=power/numberofsegment/windowpower*fs;

figure(3);
plot(w,db(fftshift(power))/2);
title('Welch PSD estimate of noised data with S = 10', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





% s = 210
S = 20; 
numberofsegment = fix((N-D+S)/S); % number of subsamples


power=zeros(FM,1);

for i = 1 : numberofsegment
   y = data2((i-1)*S+1:(i-1)*S+D);
   
   power= power + (abs(fft((y(1:D).*ham(:)),FM)/D).^2);

end

power=power/numberofsegment/windowpower*fs;

figure(4);
plot(w,db(fftshift(power))/2);
title('Welch PSD estimate of noised data with S = 20', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;

