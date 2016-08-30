%% ECE-311, HW-7, Problem 2, 05/21/15, Casimir Sowinski
%% Problem 2: 
% For a system with plant G_p(s) and K = 1.64, determine the gain crossover 
% frequency, phase margin, plant Type and the appropriate error 
% coefficient, Ki.
% 
% <<EQN_P2.PNG>>
% 
%% Find: 
% * Gain crossover frequency
% * Phase margin
% * Plant type
% * Error coefficient, K_i
clc
clear
%% Initialize:

% Init  vars
s       = tf('s');                  % Symbol for TF
K       = 1.64;                     % Gain
G_p     = (s+8)/((s+1)*(s+2)*(s+6)) % Plant TF
OLTF    = K*G_p                    % Open loop TF
CLTF    = OLTF/(1+OLTF)
[Gm,Pm,Wg,Wp] = margin(OLTF)

% Graph OLTF, show margins
figure(1)
margin(OLTF);

%% Results:
% * Crossover Frequency:    Wg = INF
% * Phase Margin:           Pm = 146.9 degrees
% * System Type:            Type 0
% * K_i:                    K_p = 2/3

