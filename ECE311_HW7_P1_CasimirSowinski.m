%% ECE-311, HW-7, Problem 1, 05/21/15, Casimir Sowinski
%% Problem 1: 
% A linearized model of the relationship between a wind turbine’s blade 
% pitch and speed is given by the following plant transfer function:
% 
% <<EQN_P1_A.PNG>>
% 
% Using the Matlab SISO tool, design a PI controller, D(s), to control the 
% speed of the turbine blades.
% 
% <<EQN_P1_B.PNG>>
% 
%% Desing Specifications: 
% * Zero steady-state error to a step input
% * M_p < 25% to a step input
% * t_s < 4 seconds to a step input (±2% criterion)
% * t_r < 1 second to a step input (0.1 to 0.9 criterion)
% * t_p < 3 seconds to a step input
% 
%% Deliverables:
% * (a) State the values of K_p and tau_c. NOTE: Every student should have 
%       unique answers. There are many thousands of possible solutions.
% * (b) On an s-plane, plot overlay of the root loci and zone of allowable 
%       poles along with your designed closed-loop poles (this is shown in 
%       the SISO tool).
% * (c) Show the step response.
% * (d) Note compliance with specs.
clc
clear
%% SISO:

% Init  vars
s       = tf('s');                  % Symbol for TF
G       = 7200/(5*s+1)              % Plant TF
% Specs
e_ss    = 0;                        % Steady state error to step input
M_p     = 0.25;                     % Overshoot to step input
t_s     = 4;                        % <, +/- 2% criterion, step
t_r     = 1;                        % 0.1 to 0.9 criterion, step
t_p     = 3;                        % step

%sisotool(G);                       % Commented for publishing

%% Results:
% * K    = 0.0019886
% * tau  = 1.2 
% * t_r  = 0.453 sec
% * t_p  = 1.23 sec
% * t_s  = 3.06 sec
% * e_ss = 0

%% Figures
% 
% <<SISO_P1_Design.PNG>>
% 
%
% <<SISO_P1_LTI.PNG>>
% 
%
% <<SISO_P1_Window.PNG>>
% 











