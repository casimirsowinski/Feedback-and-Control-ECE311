%% ECE-311, HW-6, Problem B-7-18, 05/14/15, Casimir Sowinski
% Problem B-7-18: Consider the unity-feedback control system with the 
% following open-loop transfer function G(s):
% 
% <<EQN_B_7_18.PNG>>
% 
clc
clear    
%% Bode plot

% Init  variables/functions
s       = tf('s');
K_1     = 1;
K_2     = 10;
K_3     = 100;
G_1     = K_1*(s+2)/(2*(s+1)*(s+10));
G_2     = K_2*(s+2)/(2*(s+1)*(s+10));
G_3     = K_3*(s+2)/(2*(s+1)*(s+10));

% Plot
figure(1)
nyquist(G_1,'r');
title('Nyquist Plot for K=1');

figure(2)
nyquist(G_2,'g');
title('Nyquist Plot for K=10');

figure(3)
nyquist(G_3,'b');
title('Nyquist Plot for K=100');
