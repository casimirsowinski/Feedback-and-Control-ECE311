%% ECE-311, HW-5, Problem B-6-11, 05/10/15, Casimir Sowinski
% Problem B-6-11: Consider the system shown in Figure 6–101. Plot the root 
% loci with MATLAB. Locate the closed-loop poles when the gain K is set 
% equal to 2.
% 
% <<B_6_11.png>>
% 

clc
clear

num = [2];
den = [1 2 6 0];

figure(1)
rlocus(num,den);

