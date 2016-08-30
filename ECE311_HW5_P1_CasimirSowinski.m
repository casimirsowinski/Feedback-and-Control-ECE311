%% ECE-311, HW-5, Problem 1, 05/10/15, Casimir Sowinski
% Problem 1: Given open-loop transfer function:
% 
% <<P1.PNG>>
% 
% * (a) Determine the value of gain K when the system oscillates
% * (b) Calculate the roots of the closed-loop system for the K determined 
%     in (a)
% * (c) Generate the root locus in MATLAB and verify the roots of the 
%     closed-loop system for the K determined in (a)

clc
clear        

%% (c) 
K       = 7*sqrt(865)-199;
num     = [K (10*K)];
den     = [1 7 20 (K+24) (10*K)];
figure(2)
rlocus(num,den);
r = roots(den)

