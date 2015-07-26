% Form Yule-Walker PSD estimates. Use model orders of 5, 15, and 30. 
% Use both biased and unbiased autorcorrelation estimates.
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

Power = zeros(FM,1);

P = 5; % order of the model
r = xcorr(data1,P,'biased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(1)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of un-noised data of baised correlation and p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


% 
% 
P = 15; % order of the model
r = xcorr(data1,P,'biased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(2)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of un-noised data of baised correlation and p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 30; % order of the model
r = xcorr(data1,P,'biased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(3)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of un-noised data of baised correlation and p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 5; % order of the model
r = xcorr(data1,P,'unbiased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(4)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of un-noised data of unbaised correlation and p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 15; % order of the model
r = xcorr(data1,P,'unbiased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(5)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of un-noised data of unbaised correlation and p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




P = 30; % order of the model
r = xcorr(data1,P,'unbiased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(6)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of un-noised data of unbaised correlation and p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;



%% basied
Power = zeros(FM,1);

P = 5; % order of the model
r = xcorr(data2,P,'biased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(7)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of noised data of baised correlation and p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


% 
% 
P = 15; % order of the model
r = xcorr(data2,P,'biased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(8)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of noised data of baised correlation and p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 30; % order of the model
r = xcorr(data2,P,'biased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(9)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of noised data of baised correlation and p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 5; % order of the model
r = xcorr(data2,P,'unbiased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(10)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of noised data of unbaised correlation and p=5', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;





P = 15; % order of the model
r = xcorr(data2,P,'unbiased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(11)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of noised data of unbaised correlation and p=15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




P = 30; % order of the model
r = xcorr(data2,P,'unbiased');
T = zeros(P,P);

%pyulear

for i = 1:P
    for j = 1:P
          T(i,j) = r(i-j+P+1);          
    end
end
b = -r(P+2:end);
a_temp = T\b;

a = [1
    a_temp
    ];
b_compute = [1
             b];
r_compute = a'*b_compute;

sig2=abs(a.'*conj(r(P+1:end)));

[h v] = freqz(1,a,FM,fs,'whole');

pxx = abs(h).^2/N*sig2;%**r_compute*5/fs;
figure(12)
plot(w,db(fftshift(pxx))/2);
title('Yule-Walker of un-noised data of unbaised correlation and p=30', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;

