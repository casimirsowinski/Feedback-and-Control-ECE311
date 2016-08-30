%% ECE-311, HW-5, Problem 2, 05/10/15, Casimir Sowinski
% Problem 2: Consider the motor control problem shown below. This problem 
% is similar to HW#4, but now tachometer feedback has been included.
%
% <<P2.png>>
%
% In order to meet a specification of 5% overshoot, the amplifier gain can 
% be found to be $K_a = 22$ (feel free to verify for yourself). Assume that 
% in addition to the overshoot specification, we also now need to meet a 2% 
% settling time of $T_s \leq 300ms$. Using the amplifier gain given above, 
% find the range of the tachometer gain $K_t$ to meet the specifications. 
% *Use the parameter root locus method.*

clc
clear
 
%% MATLAB verification
s       = tf('s');
syms    K_a; 
syms    K_t;
sysa    = K_a;
sysb    = 26.03/(s+33.14);
sysc    = K_t;
sys1    = feedback(series(K_a,sysb),K_t);
sysd    = 1/s;
syse    = 1;
sys2    = feedback(series(sys1,sysd),syse)
 
% Find unit-step responses
[y1_Step,t1_Step] = step(sys1);
 
% Plot unit-step responses
figure(1);
h1 = plot(t1_Step,y1_Step,'r-','LineWidth',2);
% Format plot
title('Unit-Step Repsonse, Lower Bound');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 t1_Step(end)]);
 
% Find stats
S = stepinfo(sys1)
 
figure(2)



