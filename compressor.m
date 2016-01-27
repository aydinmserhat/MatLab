clc;
clear;

A=3.28; % Nitrogen gas constants
B=0.000593;
C=0;
D=4000;
R=8.314;

P1 = input('enter pressure(bar) before compressor : ');
P2 = input('enter pressure(bar) after compressor : ');
T_1 = input('please enter first temperature : ');
T_2 = input('please enter second initial temperature higher than first one, RANDOMLY : ');

i = 1;
T2(i) = T_2;
T1 = T_1;
TO(i)=T2(i)/T1;

error = 2;
tolerans = 0.0001;
while error > tolerans
  CpS = R*(A+(B*T1+(C*T1^2+D/((TO(i)^2)*(T1^2)))*(TO(i)+1)/2)*((TO(i)-1)/log(TO(i))));
  CpH = R*(A+(B/2)*T1*(TO(i)+1)+(C/3)*(T1^2)*(TO(i)^2+TO(i)+1)+D/(TO(i)*T1^2));
  T2(i+1) = exp(R*log(P2/P1)/CpS + log(T1));
  %T2(i+1) = T1*(exp((1.74+R*log(P2/P1))/CpS));
  TO(i+1) = T2(i+1)/T1;
  error = abs((T2(i+1) - T2(i))/T2(i));
  i = i + 1;
end
fprintf('mean heat enthalpy capacity Cp_H = %0.3f kj/kmol*K \r\n', CpH)
fprintf('mean heat entropy capacity Cp_S = %0.3f kj/kmol*K \r\n', CpS)
fprintf('ideal temperature at outlet of compressor = %0.2f Kelvin \r\n',T2(i))
fprintf('OUTLET TEMPERATURE WAS CALCULATED FOR IDEAL NITROGEN GAS TO MAKE EASY TO EQUATION AND ITERATION\r\n')

Tc = 126.2; % kelvin
Pc = 34; % bar
Tr1 = T_1/Tc;
Tr2 = T2(i)/Tc;
Pr1 = P1/Pc;
Pr2 = P2/Pc;
% p=psi s=sigma e=epsilon a=alfaT B=beta
w = 0.08664; 
p = 0.42748; 
a1 = Tr1^-0.5;
a2 = Tr2^-0.5;
s = 1; 
e = 0;
B1 = w*Pr1/Tr1;
B2 = w*Pr2/Tr2;
q1 = (p)/(w*Tr1^1.5);
q2 = (p)/(w*Tr2^1.5);
Error = 1; 
Tolerans = 0.000001; 
Z0_1 = 1; 
Z0_2 = 1; 
n = 0;

while Error>Tolerans
  Z1 = 1 + B1 - q1*B1*((Z0_1 - B1) / ((Z0_1 + e*B1)*(Z0_1 + s*B1)));
  Z2 = 1 + B2 - q2*B2*((Z0_2 - B2) / ((Z0_2 + e*B2)*(Z0_2 + s*B2)));
  Error = abs(Z2 - Z0_2);
  Z0_1 = Z1;
  Z0_2 = Z2;
  n = n + 1;
end
Z1;
Z2;

I1 = log((Z1 + B1)/Z1);
I2 = log((Z2 + B2)/Z2);

Hr1 = R*T_1*(Z1 - 1 + (-0.5 - 1)*q1*I1); % kj/kmol
Sr1 = R*(log(Z1 - B1) + (-0.5*q1*I1)); % kj/kmol*K

Hr2 = R*T2(i)*(Z2 - 1 + (-0.5 - 1)*q2*I2); % kj/kmol
Sr2 = R*(log(Z2 - B2) + (-0.5*q2*I2)); % kj/kmol*K

if P1 == 36
  HE1 = 0;
else 
  HE1 = CpH*(313 - T2(i));
end

dH_ig = CpH * (T2(i) - T1);
dH_Com = dH_ig - Hr1 + Hr2;
dH = (dH_Com + HE1) / 28;
real_dH = dH / 0.75;

fprintf('ideal work of compressor #3 Ws = %0.3f kj/kg \r\n', dH)
fprintf('real work of compressor #3 Ws = %0.3f kj/kg \r\n' , real_dH)

