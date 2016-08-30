%% ECE-311, HW-3, Problem 15, 04/19/15, Casimir Sowinski
% B𤂿5. Using MATLAB, obtain the unit-step response curve for the unity-
% feedback control system whose open-loop transfer function is
% $$G(s)=10/(s(s+2)(s+4))$$
% Using MATLAB, obtain also the rise time, peak time, maximum overshoot, 
% and settling time in the unit-step response curve.
clc
clear

%% Initialize systems
s       = tf('s');

% Initialize the system
sysa    = 10/(s*(s+2)*(s+4));
sysb    = 1;
sys1    = feedback(sysa,sysb);


%% Find system responses

% Find unit-step responses
[y1_Step,t1_Step] = step(sys1);

%% Plot responses 

% Plot unit-step responses
figure(1);
h2a = plot(t1_Step,y1_Step,'r-','LineWidth',2);
% Format plot
title('Unit-Step Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 t1_Step(end)]);
%hleg2 = legend([h2a h2b h2c h2d],'x_1','x_2','x_3','e');

%% Find stats

S = stepinfo(sys1)
