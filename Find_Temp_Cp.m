% finding Cp and T_outlet (iteration) all equation depends on temperature

clc;
clear;
% ethylene gas
A = 1.424;
B = 14.394*10^-3;
C = -4.393*10^-6;
D = 0;
R = 8.314;
T1 = 573.15;
T_i = 574; % random initial outflow
TO =T_i / T1;

error = 1;
tolerans = 0.00000000001;
n = 0;

while error > tolerans
  CpS=R*(A+(B*T1+(C*T1^2+D/((TO^2)*(T1^2)))*(TO+1)/2)*((TO-1)/log(TO)));
  CpH= R*(A+(B/2)*T1*(TO+1)+(C/3)*(T1^2)*(TO^2+TO+1)+D/(TO*T1^2));
  T2 = exp(R*-3.1135/CpS + 6.3511);
  TO = T2/T1;
  error = error - abs((T_i - T2)/T_i);
  n = n + 1;
end

CpS
CpH
T2
n
