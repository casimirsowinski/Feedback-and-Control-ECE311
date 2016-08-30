%% ECE-311, HW-5, Problem 3, 05/10/15, Casimir Sowinski
% Problem 3: Sketch (by hand) the root locus having the open-loop transfer 
% functions given below. In addition to the sketch, specifically solve for 
% (if applicable) asymptote centers, breakaway points, and values of s at 
% any crossings of the imaginary axis.
% 
% <<P3.PNG>>
% 

clc
clear        

%% (d) of (a)
K       = 1;
num     = [1 1];
den     = [1 0 0];
figure(1)
rlocus(num,den);
r_a = roots(den)

%% (d) of (b)
K       = 1;
num     = [1];
den     = [1 4 4 0];
figure(2)
rlocus(num,den);
r_b = roots(den)

%% (d) of (c)
K       = 1;
num     = [1];
den     = [1 20 101 0];
figure(3)
rlocus(num,den);
r_c = roots(den)
