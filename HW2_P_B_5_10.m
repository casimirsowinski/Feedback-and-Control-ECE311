%% ECE-311, HW-2, 04/12/15, Casimir Sowinski
% Using MATLAB, obtain the unit-step response, unit-ramp response, and 
% unit-impulse response of the following system: 
% $C(s)/R(S)=10/(s^2+2s+10)$
% where R(s) and C(s) are Laplace transforms of the input r(t) and output 
% c(t), respectively.
clc
clear

% Initialize blocks
s       = tf('s');
sys1    = 10/(s^2+2*s+10);

% Find unit-step response
figure(1);
step(sys1);

% Find unit-ramp
sys2    = 1/s;                  % Init integrator for unit-ramp response
sys3    = series(sys1, sys2);   % Mult integrator and sys1
figure(2);
step(sys3);
title('Ramp Response');

% Find impulse response 
figure(3);
impulse(sys1);