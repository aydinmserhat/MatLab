% thermodynamics-II homework-1 resudial properties table

fprintf('THERMODYNAMICS-II HOMEWORK 1\r\n')
clc;
clear;

%P = input('please enter any pressure value :');
%T = input('please enter any temperature value :');
P = [100 100 50 50 20 20 10 10]; % pressure data set
T = [600 500 600 500 445 475 445 475];  % temperature data set

R = 8.3144 
Tc = 150 % critical temperature of gas A
Pc = 6 % critical temperature of gas A
w = 0.77 % acentric factor of gas A
Pr = P/Pc 
Tr = T/Tc

% for second virial equation 
B0 = 0.083 - 0.422*(Tr.^1.6).^-1;
B1 = 0.139 - 0.172*(Tr.^4.2).^-1;
dB0 = 0.675 * (Tr.^2.6).^-1;
dB1 = 0.722 * (Tr.^5.2).^-1;

Hr = R*Tc*Pr.*(B0 - Tr.*dB0 + w*(B1 - Tr.*dB1)) % resudial enthalpy formula
Sr = -R*Pr.*(dB0 + w*dB1) % resudial entropy formula

dH_i = -6269.75; % ideal enthalpy value from part a of question 1
dS_i = 1.34; % ideal entropy value from part a of question 1
fprintf('ideal enthalpy ∆H_ig = %0.3f j/mol\r\n',dH_i)
fprintf('ideal entropy ∆S_ig = %0.3f j/mol*K\r\n' ,dS_i)

Hr_1 = Hr(1); % enthalpy resudial 1 @step 1 for part c
Hr_2 = Hr(5); % enthalpy resudial 2 @step 3 for part c

Sr_1 = Sr(1); % entropy resudial 1 @step 3 for part c
Sr_2 = Sr(5); % entropy resudial 2 @step 3 for part c

dH = dH_i - Hr_1 + Hr_2;  % part c of question 1
dS = dS_i - Sr_1 + Sr_2;  % part c of question 1

Ws = dH; % Work shaft for part c of question 1
fprintf('total work produced Ws = %0.3f j/mol\r\n', Ws)
fprintf('entropy change ∆S = %0.3f j/mol*K\r\n', dS)
 
