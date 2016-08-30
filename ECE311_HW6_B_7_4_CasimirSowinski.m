%% ECE-311, HW-6, Problem B-7-4, 05/14/15, Casimir Sowinski
% Problem B-7-4: Plot the Bode diagram of
% 
% <<EQN_B_7_4.PNG>>
% 
clc
clear    
%% Bode plot
s       = tf('s');
num     = [0 10 4 10];
den     = [1 0.8 9 0];

figure(1)
bode(num,den);
title('Bode Plot for G(s)=10(s^2+0.4s+1)/(s(s^2+0.8s+9))');