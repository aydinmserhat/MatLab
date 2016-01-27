% compressibility factor 
% redlyich-kwong EQS 
% nitrogen gas

clc
clear all
input ('This m_file can be used only for Redlich/Kwong equation.')
input ('The critical temperature and pressure values belong to Nitrogen.')
T=input('Enter a temperature value: ') % Kelvin
P=input('Enter a pressure value: ') % bar
R = 8.314; % kpa*m^3 / mol*K
Tc=496.9;
Pc=31.43; % bar 
Tr=T/Tc; 
Pr=P/Pc;
% p=psi s=sigma e=epsilon a=alfaT B=beta
w=0.08664; 
p=0.42748; 
a=Tr^-0.5; 
s=1; 
e=0;
B=w*Pr/Tr; 
q=(p)/(w*Tr^1.5);
Error=1; 
Tolerans=0.000001; 
Z0=1;  
n=0;

while Error>Tolerans
  Z=1+B-q*B*((Z0-B)/((Z0+e*B)*(Z0+s*B)));
  Error=abs(Z-Z0);
  Z0=Z;
  n=n+1;
end
Z
