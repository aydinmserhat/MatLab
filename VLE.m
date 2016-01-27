% find liquid phase while temperature and vapor phase are konown
% methyl ethyl ketone(1)/toluene(2)
clc;
clear;
y1 = 0.55;
y2 = 1 - y1;
t = 50;
A1 = 14.1334;
B1 = 2838.24;
C1 = 218.690;
A2 = 13.9320;
B2 = 3056.96;
C2 = 217.625;

i = 1;
x_1(i) = 0.2;
error = 1;
tolerans = 0.0001;
while error > tolerans
  x_2(i) = 1 - x_1(i);
  P1_sat = exp(A1 - B1/(t + C1));
  P2_sat = exp(A2 - B2/(t + C2));
  gama1 = exp((0.368 - 0.3268*x_1(i))*x_2(i)^2);
  gama2 = exp((0.2046 + 0.3268*x_2(i))*x_1(i)^2);
  P = (y1/gama1/P1_sat + y2/gama2/P2_sat)^-1;
  x_1(i+1) = (y1*P)/(gama1*P1_sat);
  error = abs((x_1(i+1) - x_1(i))/x_1(i));
  i = i + 1;
end
x_1(i)
i
