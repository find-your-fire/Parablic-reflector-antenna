%%Antenna Properties
h1=input('Input Value for radius in m:');
h2 = h1/2;
%Design antenna at frequency 10000000000Hz;
antennaObject = design(dipole,10000000000);
%Define backing structure
antennaObject = reflectorParabolic('Exciter',antennaObject);
%Adjust backing structure dimensions
antennaObject.Radius=h1;
antennaObject.FocalLength = h2;
%Antenna Tilt
antennaObject.Tilt = 30;
antennaObject.TiltAxis = 'X';
%Properties changed
antennaObject.Exciter.Tilt = 90;
antennaObject.Exciter.TiltAxis = 'Y';

%Antenna analysis
%Define plot Frequency 
plotFrequency = 10000000000;
%Define Frequency Range
freqRange = (9.5:0.1:10.5)*1e9;
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
figure;impedance(antennaObject,freqRange);

%impedance for Efficiency
E=h2/(h1*2);
E1=['Efficiency = ', num2str(E)];
disp(E1);

%impedance for BeamWidth
fm = (10*10^9);
c=3*10^8;
L=c/fm;
B=(70*L)/(h1*2);
B1=['Beam Width =',num2str(B)];
disp(B1);

%Gain
a=pi;
r=h1*2;
l=L;
e=E;
G1=(e)*((a*r)/(l))^2;
o=10*log10(G1);

G2=['Gain(dB) =',num2str(o)];
disp(G2);


