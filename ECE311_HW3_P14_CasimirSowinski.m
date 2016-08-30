%% ECE-311, HW-3, Problem 14, 04/17/15, Casimir Sowinski
% B𤂿4. Consider the position control system shown in Figure 5�78. Write 
% a MATLAB program to obtain a unit-step response and a unit-ramp response 
% of the system. Plot curves x1(t) versus t, x2(t) versus t, x3(t) versus 
% t, and e(t) versus t [where e(t)=r(t)-x1(t)] for both the unit-step 
% response and the unit-ramp response.
clc
clear

%% Initialize systems
s       = tf('s');

% Initialize the system
sysa    = 4;
sysb    = 1/s;
sysc    = 5;
sysd    = 2/(0.1*s+1);
syse    = 1;
sysf    = 1/s;
sysg    = 1;
sys1    = feedback(series(sysa,series(feedback(series(series(sysb,sysc),sysd),syse),sysf)),sysg);

% Find signals x1, x2, x3, and e
x1hand  = 400/(s^3+10*s^2+100*s+400)     % Transfer function found by hand for verification
x1      = sys1
x2      = x1/(1/s)
x3      = x2/(10/(0.1*s+1))
e1      = 1 - x1

%% Find system responses

% Find unit-step responses
[y1_Step,t1_Step] = step(x1);
[y2_Step,t2_Step] = step(x2);
[y3_Step,t3_Step] = step(x3);
[ye_Step,te_Step] = step(e1);

% Prepare systems for unit-ramp responses by series-ing with an integrator
sysa    = 1/s;
x1_R  = series(x1,sysa);
x2_R  = series(x2,sysa);
x3_R  = series(x3,sysa);
e1_R  = series(e1,sysa);

% Find unit-ramp responses
[y1_Ramp,t1_Ramp] = step(x1_R);
[y2_Ramp,t2_Ramp] = step(x2_R);
[y3_Ramp,t3_Ramp] = step(x3_R);
[ye_Ramp,te_Ramp] = step(e1_R);

%% Plot responses 

% Plot unit-step responses
figure(1);
h2a = plot(t1_Step,y1_Step,'r-','LineWidth',2);
hold on
h2b = plot(t2_Step,y2_Step,'g-','LineWidth',2);
h2c = plot(t3_Step,y3_Step,'b-','LineWidth',2);
h2d = plot(te_Step,ye_Step,'m-','LineWidth',2);
hold off
% Format plot
title('Unit-Step Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 t3_Ramp(end)]);
hleg2 = legend([h2a h2b h2c h2d],'x_1','x_2','x_3','e');

% Plot unit-ramp responses
figure(2);
h3a = plot(t1_Ramp,y1_Ramp,'r-','LineWidth',2);
hold on
h3b = plot(t2_Ramp,y2_Ramp,'g-','LineWidth',2);
h3c = plot(t3_Ramp,y3_Ramp,'b-','LineWidth',2);
h3d = plot(te_Ramp,ye_Ramp,'m-','LineWidth',2);
hold off
% Format plot
title('Unit-Ramp Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 t2_Ramp(end)]);
hleg3 = legend([h3a h3b h3c h3d],'x1','x2','x3','e');
