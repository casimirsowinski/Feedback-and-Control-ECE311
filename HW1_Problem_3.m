% ECE-311, HW-1, 04/05/15, Casimir Sowinski
% In MATLAB:
%   (a) Compute the closed-loop transfer function using 'series' and 
%       'feedback' functions.
%   (b) Obtain the closed-loop system unit step response and verify the 
%       final value of 2/5.
clc
clear

% (a)
% Initialize blocks
s       = tf('s');
sys1    = 1/(s+1)
sys2    = (s+2)/(s+3)

% Find closed-loop transfer function
sys3    = series(sys1, sys2)
sys4    = feedback(sys3, 1)

% (b)
% Find closed-loop unit step response
figure(1);
step(sys4);
xlim([0 10]);
% Limit verified at 2/5



