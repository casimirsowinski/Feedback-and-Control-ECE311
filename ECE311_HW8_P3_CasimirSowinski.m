%% ECE-311, HW-8, Problem 3, 05/28/15, Casimir Sowinski
%% Problem 3: 
% Given the system below: 
% 
% <<EQN_P1.PNG>>
% 
% Following the procedures discussed in lecture, design a compensator to 
% meet the following specification:
%%
% * Increase the cross-over frequency by at least a factor of 3
% * Settling time faster than original system (around twice as fast). 
%   Note, this may require additional tuning beyond rules of thumb!
% 
% State the new phase margin, cross-over frequency, error coefficient, 
% verify the specs are met State the values of appropriate design
% coefficients (K, a, b, d, etc.)
clc
clear

%% Step 1 - Get Bode Plot of Uncompensated System

% Init vars
s       = tf('s');                  % Symbol for TF
K_u     = 20;
G_p     = 1/((s+1)*(s+6));          % Plant TF
G_u     = K_u*G_p
sys_u   = feedback(G_u,1);          % CL system

[Gm_u,Pm_u,Wg_u,Wp_u] = margin(G_u);%%%%%%%% % Margins for uncompensated system
Wp_d    = 3*Wp_u                    % Desired crossover frequency

% Make title
titA    = 'Uncompensated System Bode Plot, PM_u: ';
titB    = num2str(Pm_u);
titC    = '\circ, Wp_u: ';
titD    = num2str(Wp_u);
titE    = ' rad/s';
titTot  = horzcat(titA,titB,titC,titD,titE);

% Plot
figure(1)
margin(G_u);
title(titTot);

%% Step 2/3 - Set a and K
% Try a Lag compensator

a1      = Wp_u/10;
b1      = a1/10;
K       = K_u;

% Init vars
C1      = (s+a1)/(s+b1);
%C1      = (s+a1)/s;
G_c1    = K*C1*G_p;
[Gm_c,Pm_c,Wg_c,Wp_c] = margin(G_c1);

% Make title
titA    = 'Compensated System Bode Plot, PM_u: ';
titB    = num2str(Pm_c);
titC    = '\circ, Wp_u: ';
titD    = num2str(Wp_c);
titE    = ' rad/s';
titTot  = horzcat(titA,titB,titC,titD,titE);

% Plot
figure(2)
margin(G_c1);
title(titTot);

%% Step 5 - Tune a and K as Necessary

%%Attempt 1)
% Make closed loop systems
sys_c1  = feedback(G_c1,1);

% Plot uncomp and comp sys 1 step response
figure(3)
subplot(2,1,1);
step(sys_c1);
title('Compensated System 1 Step Resonse');
subplot(2,1,2);
step(sys_u);
title('Uncompensated System Step Resonse');

% Display step info
S_u     = stepinfo(sys_u);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S_c1    = stepinfo(sys_c1);%%%%%%%%%%%%%%%%%%%%%

% Display new crossover frequency
[Gm_c1,Pm_c1,Wg_c1,Wp_c1] = margin(G_c1);%%%%%%%%%%%%%

%%Attempt 2)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adjust a and K and system
a2      = 10*a1/1;
b2      = 1*b1/1;
K2      = 100;
%1,1,19:1.04
% Produce new systems
C2      = (s+a2)/(s+b2);
C2      = (s+1)/(s+1);
G_c2    = K2*K*C2*G_p;
sys_c2  = feedback(G_c2,1);

% Plot uncomp and comp sys 2 step response
figure(4)
subplot(2,1,1);
step(sys_c2);
title('Compensated System 2 Step Resonse');
subplot(2,1,2);
step(sys_u);
title('Uncompensated System Step Resonse');

% Display step info
S_c2    = stepinfo(sys_c2)

% Display new crossover frequency
[Gm_c2,Pm_c2,Wg_c2,Wp_c2] = margin(G_c2);%%%%%%%%%%%%%%%%

%% Fine tune with SISO 
% sisotool(G_p);
% 
% <<SISO_P1_Design.PNG>>
% 
%
% <<SISO_P1_LTI.PNG>>
% 
%
% <<SISO_P1_Window.PNG>>
% 

K_SISO      = 23.845;
C_SISO      = (1+0.26*s)/(1+0.12*s);
sys_SISO    = feedback(K_SISO*C_SISO*G_u,1);
a_SISO      = 1/0.26;
b_SISO      = 1/0.12;
d_SISO      = a_SISO/b_SISO;
S_SISO      = stepinfo(sys_SISO);
%% Results

% Find margins and plot bode of final design
[Gm_c,Pm_c,Wg_c,Wp_c] = margin(sys_SISO); 
figure(5)
margin(sys_SISO)

% Find difference in settling time
delta_ts = abs(S_u.SettlingTime - S_SISO.SettlingTime);
 
% Print results 
fprintf('Phase margin = %4.2f\n',Pm_c);
fprintf('Desired Crossover Frequency > %4.2f\n',Wp_d);
fprintf('Crossover Frequency = %4.2f\n',Wp_c);
fprintf('K_i = Inf\n');
fprintf('K = %4.2f\n',K_SISO);
fprintf('a = %4.2f\n',a_SISO);
fprintf('b = %4.2f\n',b_SISO);
fprintf('d = %4.2f\n',d_SISO);
fprintf('Desired Compensated settling time = %4.2f s\n',S_u.SettlingTime/2);
fprintf('Compensated settling time = %4.2f s\n',S_SISO.SettlingTime);


