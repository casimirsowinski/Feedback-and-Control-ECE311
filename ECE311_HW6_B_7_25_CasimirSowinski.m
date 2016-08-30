%% ECE-311, HW-6, Problem B-7-25, 05/14/15, Casimir Sowinski
% Problem B-7-25: Consider the system shown in Figure 7–162. Draw a Bode 
% diagram of the open-loop transfer function G(s). Determine the phase 
% margin and gain margin with MATLAB.
% 
% <<EQN_B_7_25.PNG>>
% 
clc
clear    
%% Bode plot with margins

% Init  variables/functions
s       = tf('s');
G       = 20*(s+1)/(s*(s^2+2*s+10)*(s+5))

% Plot
figure(1)
margin(G);
[mGain,mPhase,cofGain,cofPhase] = margin(G);

% Print found values
fprintf('Gain margin:\t\t%d\n',mGain);
fprintf('Phase margin:\t\t%d\n',mPhase);
fprintf('Gain crossover frequency:\t%d\n',cofGain);
fprintf('Phase crossover frequency:\t%d\n',cofPhase);
