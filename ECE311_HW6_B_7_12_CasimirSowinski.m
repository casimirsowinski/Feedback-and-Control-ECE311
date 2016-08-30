%% ECE-311, HW-6, Problem B-7-12, 05/14/15, Casimir Sowinski
% Problem B-7-12: Draw a Nyquist plot of the following G(s):
% 
% <<EQN_B_7_12.PNG>>
% 
clc
clear    
%% Bode plot
s       = tf('s');
num     = [1];
den     = [1 0.8 1 0];

figure(1)
nyquist(num,den);
title('Nyquist Plot for G(s)=1/(s(s^2+0.8s+1))');
xlim([-3 1]);
ylim([-4 4]);