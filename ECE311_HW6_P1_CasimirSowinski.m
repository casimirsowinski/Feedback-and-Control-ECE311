%% ECE-311, HW-6, Problem 1, 05/14/15, Casimir Sowinski
% Problem 1: Given the Bode magnitude plot shown:
% 
% <<EQN_P1.PNG>>
% 
% * (a) Sketch the corresponding asymptotic phase curve for the system. 
%       Assume the system transfer function is minimum phase.
% * (b) Determine the transfer function corresponding the Bode plot sketch
% * (c) Determine the error coefficients K_p, K_v, K_a
% * (d) Using your answer to (c), determine the closed-loop steady state 
%       error to a step input of $R(s)=2/s$, and to a ramp input of 
%       $R(s)=4/s^2$ You may assume the standard unity negative gain 
%       feedback configuration.

clc
clear    
%% Bode plot with margins

% Init  variables/functions
s       = tf('s');                      % tf variable
K       = 400;                          % Gain
T       = K*(s+1)/(s*(s+10)^2);         % T(s)

% Plot bode diagram
figure(1)
bode(T);

% Plot bode diagram w/ asymptotes
figure(2)
asymp(T,.01,100);
