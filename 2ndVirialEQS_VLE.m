% secand virial coefficient vapor-liquid phase equilibrium
% redlich-kwong equation of state
% n-butane(1) n-octane(2)
clc;
clear;
R = 8.314
T = 600; % Kelvin
P = 1600; % kPa
y2 = 0.5;
y1 = 0.5;
Tc = [425.1 491.7;491.7 568.7];
Pc = [37.96 31.43;31.43 24.90]; 
Vc = [255 370.5;370.5 486];
Zc = [0.274 0.265;0.265 0.256];
w = [0.2 0.3;0.3 0.4];

delta = 0
for i = 1:2
  for j = 1:2
    Tr(i,j) = T/Tc(i,j);
    Pr(i,j) = P/Pc(i,j);
    B0 = 0.083 - 0.422/Tr(i,j)^1.6;
    B1 = 0.139 - 0.172/Tr(i,j)^4.2
    B(i,j) = B0 + w(i,j)*B1
    if i == j
      delta = delta + -1*B(i,j)
    else
      delta = delta + B(i,j)
    end
  end
end
phi_1 = exp((P/R/T)*(B(1,1) + delta*y2^2))
phi_2 = exp((P/R/T)*(B(2,2) + delta*y1^2))
