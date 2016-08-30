%% ECE-311, HW-3, Problem 13, 04/17/15, Casimir Sowinski
% B𤂿3. Figure 5�77 shows three systems. System I is a positional servo 
% system. System II is a positional servo system with PD control action. 
% System III is a positional servo system with velocity feedback. Compare 
% the unit-step, unit-impulse and unit-ramp responses of the three systems.
% Which system is best with respect to the speed of response and maximum 
% overshoot in the step response?
clc
clear

%% Initialize systems
s       = tf('s');

% Initialize system I
sysa    = 5;
sysb    = 1/(s*(5*s+1));
sysc    = 1;
sys1    = feedback(series(sysa,sysb),sysc);

% Initialize system II
sysa    = 5*(1+0.8*s);
sysb    = 1/(s*(5*s+1));
sysc    = 1;
sys2    = feedback(series(sysa,sysb),sysc);

% Initialize system III
sysa    = 5;
sysb    = 1/(5*s+1);
sysc    = 0.8;
sysd    = 1/s;
syse    = 1;
sys3    = feedback(series(feedback(series(sysa,sysb),sysc),sysd),syse);

%% Find system responses

% Find impulse responses
[y1_Imps,t1_Imps] = impulse(sys1);
[y2_Imps,t2_Imps] = impulse(sys2);
[y3_Imps,t3_Imps] = impulse(sys3);

% Find unit-step responses
[y1_Step,t1_Step] = step(sys1);
[y2_Step,t2_Step] = step(sys2);
[y3_Step,t3_Step] = step(sys3);

% Prepare systems for unit-ramp responses by series-ing with an integrator
sysa    = 1/s;
sys1_R  = series(sys1,sysa);
sys2_R  = series(sys2,sysa);
sys3_R  = series(sys3,sysa);

% Find unit-ramp responses
[y1_Ramp,t1_Ramp] = step(sys1_R);
[y2_Ramp,t2_Ramp] = step(sys2_R);
[y3_Ramp,t3_Ramp] = step(sys3_R);

%% Plot responses and find stats of unit-step responses

% Plot impulse responses
figure(1);
h1a = plot(t1_Imps,y1_Imps,'r-','LineWidth',2);
hold on
h1b = plot(t2_Imps,y2_Imps,'g-','LineWidth',2);
h1c = plot(t3_Imps,y3_Imps,'b-','LineWidth',2);
hold off
% Format plot
title('Impulse Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 t1_Imps(end)]);
hleg1 = legend([h1a h1b h1c],'System I','System II','System III');

% Plot unit-step responses
figure(2);
h2a = plot(t1_Step,y1_Step,'r-','LineWidth',2);
hold on
h2b = plot(t2_Step,y2_Step,'g-','LineWidth',2);
h2c = plot(t3_Step,y3_Step,'b-','LineWidth',2);
hold off
% Format plot
title('Unit-Step Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 t1_Step(end)]);
hleg2 = legend([h2a h2b h2c],'System I','System II','System III');

% Plot unit-ramp responses
figure(3);
h3a = plot(t1_Ramp,y1_Ramp,'r-','LineWidth',2);
hold on
h3b = plot(t2_Ramp,y2_Ramp,'g-','LineWidth',2);
h3c = plot(t3_Ramp,y3_Ramp,'b-','LineWidth',2);
hold off
% Format plot
title('Unit-Ramp Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');
xlim([0 15]);
hleg3 = legend([h3a h3b h3c],'System I','System II','System III','Location','NorthWest');

% Find stats for unit step
fprintf('\n___________Unit-Step Stats___________');
fprintf('\nSystem I:');
S1 = stepinfo(sys1)
fprintf('System II:');
S2 = stepinfo(sys2)
fprintf('System III:');
S3 = stepinfo(sys3)
fprintf('_____________________________________');

%% Discuss
% Which system is best with respect to the speed of response and maximum 
% overshoot in the step response?

% System II has a better response time, but system III has a smaller 
% overshoot. System III is simply the worst.
