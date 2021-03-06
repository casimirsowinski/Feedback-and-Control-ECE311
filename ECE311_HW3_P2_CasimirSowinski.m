%% ECE-311, HW-2, Problem 2, 04/12/15, Casimir Sowinski
% B𤂿2. Obtain both analytically and computationally the rise time, peak 
% time, maximum overshoot, and settling time in the unit-step response of a 
% closed-loop system given by:
% $C(s)/R(S)=36/(s^2+2s+36)$
clc
clear


%% Computationally
% Initialize blocks
s       = tf('s');
sys1    = 36/(s^2+2*s+36);

% Find unit-step response
[y, t] = step(sys1);

% Find stats
S = stepinfo(sys1)

% Plot
figure(1);
h1 = plot(t,y);
% Format plot
title('Step Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');


