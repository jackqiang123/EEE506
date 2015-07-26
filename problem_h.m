% (h) Form MUSIC PSD estimates. Use model orders of 5, 15, and 30. Try three different values for the number of signal space vectors.

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



x= data1;


%% p =5
p = 5; % this is the model order
Number    = length(x)+2*p-2;
x    = x(:);
xpad = [zeros(p-1,1);x;zeros(p-1,1)];
for  i=1:p
    Xtempe(:,i)=xpad(p-i+1:Number-i+1);
end;


R = Xtempe'*Xtempe/N; % R is repalce when order changes;


M = 4; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(1)

plot(w,(Px));
title('Music of un-noised data, p=5, signal = 4', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




M = 3; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(2)

plot(w,(Px));
title('Music of un-noised data, p=5, signal = 3', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


M = 2; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(3)

plot(w,(Px));
title('Music of un-noised data, p=5, signal = 2', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;







%% p =15
p = 15; % this is the model order
Number    = length(x)+2*p-2;
clearvars Xtempe;

xpad = [zeros(p-1,1);x;zeros(p-1,1)];
for  i=1:p
    Xtempe(:,i)=xpad(p-i+1:Number-i+1);
end;


R = Xtempe'*Xtempe/N; % R is repalce when order changes;


M = 14; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(4)

plot(w,(Px));
title('Music of un-noised data, p=15, signal = 14', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




M = 11; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(5)

plot(w,(Px));
title('Music of un-noised data, p=15, signal = 11', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


M = 9; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(6)

plot(w,(Px));
title('Music of un-noised data, p=15, signal = 9', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




%% p =30
p = 30; % this is the model order
Number    = length(x)+2*p-2;
clearvars Xtempe;

xpad = [zeros(p-1,1);x;zeros(p-1,1)];
for  i=1:p
    Xtempe(:,i)=xpad(p-i+1:Number-i+1);
end;


R = Xtempe'*Xtempe/N; % R is repalce when order changes;


M = 25; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(7)

plot(w,(Px));
title('Music of un-noised data, p=30, signal = 25', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




M = 20; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(8)

plot(w,(Px));
title('Music of un-noised data, p=30, signal = 20', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


M = 15; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(9)

plot(w,(Px));
title('Music of un-noised data, p=30, signal = 15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;






x= data2;


%% p =5
p = 5; % this is the model order
Number    = length(x)+2*p-2;
clearvars Xtempe;
x    = x(:);
xpad = [zeros(p-1,1);x;zeros(p-1,1)];
for  i=1:p
    Xtempe(:,i)=xpad(p-i+1:Number-i+1);
end;


R = Xtempe'*Xtempe/N; % R is repalce when order changes;


M = 4; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(10)

plot(w,(Px));
title('Music of noised data, p=5, signal = 4', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




M = 3; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(11)

plot(w,(Px));
title('Music of noised data, p=5, signal = 3', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


M = 2; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(12)

plot(w,(Px));
title('Music of noised data, p=5, signal = 2', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;







%% p =15
p = 15; % this is the model order
Number    = length(x)+2*p-2;
clearvars Xtempe;

xpad = [zeros(p-1,1);x;zeros(p-1,1)];
for  i=1:p
    Xtempe(:,i)=xpad(p-i+1:Number-i+1);
end;


R = Xtempe'*Xtempe/N; % R is repalce when order changes;


M = 14; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(13)

plot(w,(Px));
title('Music of noised data, p=15, signal = 14', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




M = 11; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(14)

plot(w,(Px));
title('Music of noised data, p=15, signal = 11', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


M = 9; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(15)

plot(w,(Px));
title('Music of noised data, p=15, signal = 9', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




%% p =30
p = 30; % this is the model order
Number    = length(x)+2*p-2;
clearvars Xtempe;

xpad = [zeros(p-1,1);x;zeros(p-1,1)];
for  i=1:p
    Xtempe(:,i)=xpad(p-i+1:Number-i+1);
end;


R = Xtempe'*Xtempe/N; % R is repalce when order changes;


M = 25; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(16)

plot(w,(Px));
title('Music of noised data, p=30, signal = 25', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;




M = 20; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(17)

plot(w,(Px));
title('Music of noised data, p=30, signal = 20', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


M = 15; % this is signal space size
[v,d]=eig(R);
[y,i]=sort(diag(d));
Px=0;
for j=1:p-M
    Px=Px+abs(fftshift(fft(v(:,i(j)),FM)));
end;
Px=-10*log10(Px);


figure(18)

plot(w,(Px));
title('Music of noised data, p=30, signal = 15', 'FontSize', 44);
xlabel('Frenquncy (Hz)', 'FontSize', 44) % x-axis label
ylabel('Signal Power Spectrum Density (dB)', 'FontSize', 44) % y-axis label
grid on;


