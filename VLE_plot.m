%plot of VLE data (x1y1P)
%methyl ethyl ketone(1)/toluene(2)
clc;
clear;

t = 50; % temperature (celcius)
A1 = 14.1334;
B1 = 2838.24;
C1 = 218.690;
A2 = 13.9320;
B2 = 3056.96;
C2 = 217.625;

x1 = 0:0.05:1;
x2 = 1 - x1;

P1_sat = exp(A1 - B1/(t + C1))
P2_sat = exp(A2 - B2/(t + C2))

gama1 = exp((0.368 - 0.3268*x1).*x2.^2)
gama2 = exp((0.2046 + 0.3268*x2).*x1.^2)
P = (x1.*gama1.*P1_sat) + (x2.*gama2.*P2_sat)
y1 = (x1.*gama1.*P1_sat)./P;

plot(x1,P,'r',y1,P)
grid
xlabel('x1,y1')
ylabel('Pressure (bar)')
legend('margules x1','margules y1')


