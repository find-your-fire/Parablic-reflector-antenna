%%Antenna Properties
x1=input('Input:');
x2=(x1)*10^9;
y1=0.029979;
y2=(y1)/2;

xi=(x2 - 500000000);
yi=(x2 + 500000000);

%Design antenna at frequency Hz
antennaObject = design(dipole,x2);
%Design backing structure
antennaObject = reflectorParabolic('Exciter',antennaObject);
%Adjust backing structure dimensions
antennaObject.Radius = y1;
antennaObject.FocalLength = y2;
%Antenna tilt
antennaObject.Tilt = 30;
antennaObject.TiltAxis = 'X';
%Properties changed
antennaObject.Exciter.Tilt = 90;
antennaObject.Exciter.TiltAxis = 'Y';


%%Antenna Analysis
%Define plot frequency range
plotFrequency = x2;
%Define Frequency Range
freqRange = (xi:0.1*1e9:yi);
%show for reflectorParabolic
figure;show(antennaObject)
%current for reflectorParabolic
figure;current(antennaObject,plotFrequency)
%pattern for reflectorParabolic
figure;pattern(antennaObject,plotFrequency)
%azimuth for reflectorParabolic
figure;patternAzimuth(antennaObject,plotFrequency)
%elevation for reflectorParabolic
figure;patternElevation(antennaObject,plotFrequency)
%impedance for reflectorParabolic
figure;impedance(antennaObject,freqRange)
%impedance for Efficiency
E =y2/(y1*2);
E1 = ['Efficency = ',num2str(E)];
disp(E1);


%impedance for Beam Width
fm=(x2);
c = 3*10^8;
L = c/fm;
B=(70*L)/(y1*2);
B1 = ['Beam Width =' ,num2str(B)];
disp(B1);

%Gain
a=pi;
r=y1*2;
l=L;
e=E;
G1=(e)*((a*r)/(l))^2;
o=10*log10(G1);

G2=['Gain(dB) = ',num2str(o)];
disp(G2);























