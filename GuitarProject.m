%Kayla Johnson, Mandy Widner, Nick Larson
%Guitar Project

%% Wav to FFT
%All Strings
[y_AS,Fs_AS] = audioread('AllStrings.wav');
Length_AS = length(y_AS);
Mono_AS = (y_AS(:,1)+y_AS(:,2))/2;
y_AS = Mono_AS;
time_AS=(1:length(y_AS))/Fs_AS;
F_AS = 1./time_AS;
NFFT_AS = 2^nextpow2(Length_AS);
f_AS = Fs_AS/2*linspace(0,1,NFFT_AS/2+1);
Y_AS = fft(y_AS,NFFT_AS)/Length_AS;
figure(1)
plot(f_AS,2*abs(Y_AS(1:NFFT_AS/2+1)))
xlim([0,1300])
xlabel('Frequency (Hz)')
ylabel('Intensity (db)')
title('All Strings FFT')
dt_AS = 1/Fs_AS;
t_AS = 0:dt_AS:(length(y_AS)*dt_AS)-dt_AS;
figure(11)
plot(t_AS,y_AS);
xlabel('Time')
ylabel('Amplitude')
title('All Strings Time vs Amplitude')

%A Chord
[y_AC,Fs_AC] = audioread('AChord.wav');
Length_AC = length(y_AC);
Mono_AC = (y_AC(:,1)+y_AC(:,2))/2;
y_AC = Mono_AC;
time_AC=(1:length(y_AC))/Fs_AC;
F_AC = 1./time_AC;
NFFT_AC = 2^nextpow2(Length_AC);
f_AC = Fs_AC/2*linspace(0,1,NFFT_AC/2+1);
Y_AC = fft(y_AC,NFFT_AC)/Length_AC;
figure(2)
plot(f_AC,2*abs(Y_AC(1:NFFT_AC/2+1)))
xlim([0,2700])
xlabel('Frequency (Hz)')
ylabel('Intensity (db)')
title('A Chord FFT')
dt_AC = 1/Fs_AC;
t_AC = 0:dt_AC:(length(y_AC)*dt_AC)-dt_AC;
figure(12)
plot(t_AC,y_AC);
xlabel('Time')
ylabel('Amplitude')
title('A Chord Time Time vs Amplitude')

%Background
[y_BG,Fs_BG] = audioread('Background.wav');
Length_BG = length(y_BG);
Mono_BG = (y_BG(:,1)+y_BG(:,2))/2;
y_BG = Mono_BG;
time_BG=(1:length(y_BG))/Fs_BG;
F_BG = 1./time_BG;
NFFT_BG = 2^nextpow2(Length_BG);
f_BG = Fs_BG/2*linspace(0,1,NFFT_BG/2+1);
Y_BG = fft(y_BG,NFFT_BG)/Length_BG;
figure(3)
plot(f_BG,2*abs(Y_BG(1:NFFT_BG/2+1)))
xlim([0,3000])
xlabel('Frequency')
ylabel('Amplitude')
title('Background FFT')
dt_BG = 1/Fs_BG;
t_BG = 0:dt_BG:(length(y_BG)*dt_BG)-dt_BG;
figure(13)
plot(t_BG,y_BG);
xlabel('Time')
ylabel('Amplitude')
title('Background Time vs Amplitude')

%E Minor
[y_EM,Fs_EM] = audioread('Eminor.wav');
Length_EM = length(y_EM);
Mono_EM = (y_EM(:,1)+y_EM(:,2))/2;
y_EM = Mono_EM;
time_EM=(1:length(y_EM))/Fs_EM;
F_EM = 1./time_EM;
NFFT_EM = 2^nextpow2(Length_EM);
f_EM = Fs_EM/2*linspace(0,1,NFFT_EM/2+1);
Y_EM = fft(y_EM,NFFT_EM)/Length_EM;
figure(4)
plot(f_EM,2*abs(Y_EM(1:NFFT_EM/2+1)))
xlim([0,1300])
xlabel('Frequency (Hz)')
ylabel('Intensity (db)')
title('E Minor FFT')
dt_EM = 1/Fs_EM;
t_EM = 0:dt_EM:(length(y_EM)*dt_EM)-dt_EM;
figure(14)
plot(t_EM,y_EM);
xlabel('Time')
ylabel('Amplitude')
title('E Minor Time vs Amplitude')

%String 1
[y_S1,Fs_S1] = audioread('String1.wav');
Length_S1 = length(y_S1);
Mono_S1 = (y_S1(:,1)+y_S1(:,2))/2;
y_S1 = Mono_S1;
time_S1=(1:length(y_S1))/Fs_S1;
F_S1 = 1./time_S1;
NFFT_S1 = 2^nextpow2(Length_S1);
f_S1 = Fs_S1/2*linspace(0,1,NFFT_S1/2+1);
Y_S1 = fft(y_S1,NFFT_S1)/Length_S1;
figure(5)
plot(f_S1,2*abs(Y_S1(1:NFFT_S1/2+1)))
xlim([0,3000])
xlabel('Frequency (Hz)')
ylabel('Intensity (db)')
title('String 1(E Note) FFT')
dt_S1 = 1/Fs_S1;
t_S1 = 0:dt_S1:(length(y_S1)*dt_S1)-dt_S1;
figure(15)
plot(t_S1,y_S1);
xlabel('Time (s)')
ylabel('Amplitude (db)')
title('String 1(E Note) Time vs Amplitude')

%String 2
[y_S2,Fs_S2] = audioread('String2.wav');
Length_S2 = length(y_S2);
Mono_S2 = (y_S2(:,1)+y_S2(:,2))/2;
y_S2 = Mono_S2;
time_S2=(1:length(y_S2))/Fs_S2;
F_S2 = 1./time_S2;
NFFT_S2 = 2^nextpow2(Length_S2);
f_S2 = Fs_S2/2*linspace(0,1,NFFT_S2/2+1);
Y_S2 = fft(y_S2,NFFT_S2)/Length_S2;
figure(6)
plot(f_S2,2*abs(Y_S2(1:NFFT_S2/2+1)))
xlim([0,1300])
xlabel('Frequency (Hz)')
ylabel('Intensity (db)')
title('String 2(B Note) FFT')
dt_S2 = 1/Fs_S2;
t_S2 = 0:dt_S2:(length(y_S2)*dt_S2)-dt_S2;
figure(16)
plot(t_S2,y_S2);
xlabel('Time')
ylabel('Amplitude')
title('String 2(B Note) Time vs Amplitude')

%String 3
[y_S3,Fs_S3] = audioread('String3.wav');
Length_S3 = length(y_S3);
Mono_S3 = (y_S3(:,1)+y_S3(:,2))/2;
y_S3 = Mono_S3;
time_S3=(1:length(y_S3))/Fs_S3;
F_S3 = 1./time_S3;
NFFT_S3 = 2^nextpow2(Length_S3);
f_S3 = Fs_S3/2*linspace(0,1,NFFT_S3/2+1);
Y_S3 = fft(y_S3,NFFT_S3)/Length_S3;
figure(7)
plot(f_S3,2*abs(Y_S3(1:NFFT_S3/2+1)))
xlim([0,1300])
xlabel('Frequency')
ylabel('Amplitude')
title('String 3(G Note) FFT')
dt_S3 = 1/Fs_S3;
t_S3 = 0:dt_S3:(length(y_S3)*dt_S3)-dt_S3;
figure(17)
plot(t_S3,y_S3);
xlabel('Time (s)')
ylabel('Amplitude (db)')
title('String 3(G Note) Time vs Amplitude')

%String 4
[y_S4,Fs_S4] = audioread('String4.wav');
Length_S4 = length(y_S4);
Mono_S4 = (y_S4(:,1)+y_S4(:,2))/2;
y_S4 = Mono_S4;
time_S4=(1:length(y_S4))/Fs_S4;
F_S4 = 1./time_S4;
NFFT_S4 = 2^nextpow2(Length_S4);
f_S4 = Fs_S4/2*linspace(0,1,NFFT_S4/2+1);
Y_S4 = fft(y_S4,NFFT_S4)/Length_S4;
figure(8)
plot(f_S4,2*abs(Y_S4(1:NFFT_S4/2+1)))
xlim([0,1300])
xlabel('Frequency')
ylabel('Amplitude')
title('String 4(D Note) FFT')
dt_S4 = 1/Fs_S4;
t_S4 = 0:dt_S4:(length(y_S4)*dt_S4)-dt_S4;
figure(18)
plot(t_S4,y_S4);
xlabel('Time')
ylabel('Amplitude')
title('String 4(D Note) Time vs Amplitude')

%String 5
[y_S5,Fs_S5] = audioread('String5.wav');
Length_S5 = length(y_S5);
Mono_S5 = (y_S5(:,1)+y_S5(:,2))/2;
y_S5 = Mono_S5;
time_S5=(1:length(y_S5))/Fs_S5;
F_S5 = 1./time_S5;
NFFT_S5 = 2^nextpow2(Length_S5);
f_S5 = Fs_S5/2*linspace(0,1,NFFT_S5/2+1);
Y_S5 = fft(y_S5,NFFT_S5)/Length_S5;
figure(9)
plot(f_S5,2*abs(Y_S5(1:NFFT_S5/2+1)))
xlim([0,1300])
xlabel('Frequency')
ylabel('Amplitude')
title('String 5(A Note) FFT')
dt_S5 = 1/Fs_S5;
t_S5 = 0:dt_S5:(length(y_S5)*dt_S5)-dt_S5;
figure(19)
plot(t_S5,y_S5);
xlabel('Time (s)')
ylabel('Amplitude (db)')
title('String 5(A Note) Time vs Amplitude')

%String 6
[y_S6,Fs_S6] = audioread('String6.wav');
Length_S6 = length(y_S6);
Mono_S6 = (y_S6(:,1)+y_S6(:,2))/2;
y_S6 = Mono_S6;
time_S6=(1:length(y_S6))/Fs_S6;
F_S6 = 1./time_S6;
NFFT_S6 = 2^nextpow2(Length_S6);
f_S6 = Fs_S6/2*linspace(0,1,NFFT_S6/2+1);
Y_S6 = fft(y_S6,NFFT_S6)/Length_S6;
figure(10)
plot(f_S6,2*abs(Y_S6(1:NFFT_S6/2+1)))
xlim([0,1300])
xlabel('Frequency')
ylabel('Amplitude')
title('String 6(E Note) FFT')
dt_S6 = 1/Fs_S6;
t_S6 = 0:dt_S6:(length(y_S6)*dt_S6)-dt_S6;
figure(20)
plot(t_S6,y_S6);
xlabel('Time')
ylabel('Amplitude')
title('String 6(E Note) Time vs Amplitude')



