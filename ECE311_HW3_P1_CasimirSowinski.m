%% ECE-311, HW-3, Problem 1, 04/19/15, Casimir Sowinski
% Problem 1: A proposed closed-loop system that includes a pacemaker and 
% the measurement of heart rate is shown below.
%
% <<Heart.png>>
%
% Design the amplifier gain to satisfy the requirement that overshoot to a 
% step in desired heart rate should be less than 10% Find a suitable range 
% of K.
clc
clear
 
%% Results of hand calculations
% The attached hand calculations resulted in a range for $K$ of
%
% $$3 \leq K \leq (3*\pi^3)/(ln(10))^2+3$$
%
% -OR-
%
% $$3 \leq K \leq 8.585$$
%
 
%% Test lower bound
s       = tf('s');
K       = 3;
% Initialize the system
sysa    = K/(1/12*s+1);
sysb    = 1/s;
sysc    = 1;
sys1    = feedback(series(sysa,sysb),sysc);
 
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
hleg1 = legend([h1],'K=3');
 
% Find stats
S = stepinfo(sys1)
 
%% Test upper bound
s       = tf('s');
K       = 8.585;
% Initialize the system
sysa    = K/(1/12*s+1);
sysb    = 1/s;
sysc    = 1;
sys2    = feedback(series(sysa,sysb),sysc);
 
% Find unit-step responses
[y2_Step,t2_Step] = step(sys2);
 
% Plot unit-step responses
figure(2);
h2 = plot(t2_Step,y2_Step,'G-','LineWidth',2);
% Format plot
title('Unit-Step Repsonse, Upper Bound');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 t2_Step(end)]);
hleg2 = legend([h2],'K=8.585');
 
% Find stats
S = stepinfo(sys2)


