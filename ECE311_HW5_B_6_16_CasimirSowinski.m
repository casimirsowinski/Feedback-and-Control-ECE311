%% ECE-311, HW-5, Problem B-6-16, 05/10/15, Casimir Sowinski
% Problem B-6-16: Consider the control system shown in Figure 6–106. 
% Determine the gain Kand time constant T of the controller Gc(s) such that 
% the closed-loop poles are located at s = -2 +/- j2
% 
% <<B_6_16.png>>
% 

clc
clear

num = [2];
den = [1 2 6 0];

figure(1)
rlocus(num,den);

