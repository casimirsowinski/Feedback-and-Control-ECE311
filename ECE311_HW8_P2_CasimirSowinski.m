%% ECE-311, HW-8, Problem 2, 05/28/15, Casimir Sowinski
%% Problem 2: 
% Given the system below: 
% 
% <<EQN_P1.PNG>>
% 
% Following the procedures discussed in lecture, design a compensator to 
% meet the following specification:
%%
% * Increase the error coefficient by a factor of 6.
% * Settling time close to original system (within 0.5 seconds). Note, 
%   this may require additional tuning beyond rules of thumb!
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
sys_u   = feedback(G_u,1);

ess     = abs(1-dcgain(sys_u));
Ki      = 1/ess-1;
Ki_des  = 6*Ki;                      % Desired error coefficient


[Gm_u,Pm_u,Wg_u,Wp_u] = margin(G_u);

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

%% Step 2/3 - Set a, b, and K
% Try a Lag compensator

a1      = Wp_u/10;
b1      = a1/10;
K       = K_u;


%% Step 4 - Get Bode of Compensated System

% Init vars
C1      = (s+a1)/(s+b1);
G_c1    = K*C1*G_p;

[Gm_c,Pm_c,Wg_c,Wp_c] = margin(G_c1) 

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

%% Step 5 - Tune a, b, and K as Necessary

%%Attempt 1)
% Make closed loop systems
%sys_u   = feedback(G_u,1);
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
S_u     = stepinfo(sys_u)
S_c1    = stepinfo(sys_c1)

%%Attempt 2)
% Adjust a and K and system
a2      = 3*a1;
b2      = 5*b1;

% Produce new systems
C2      = (s+a2)/(s+b2);
G_c2    = K*C2*G_p;
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
S_c2    = stepinfo(sys_c2);

%% Results

% Find margins and plot bode of final design
[Gm_c,Pm_c,Wg_c,Wp_c] = margin(G_c2); 
figure(5)
margin(G_c2)



% Find error coefficient and difference in settling time
ess_c   = abs(1-dcgain(sys_c2));
Ki_c    = 1/ess_c-1;
delta_ts = S_u.SettlingTime - S_c2.SettlingTime;
 

% Print Results
fprintf('Phase margin = %4.2f degrees\n',Pm_c);
fprintf('Crossover Frequency = %4.2f rad/s\n',Wg_c);
fprintf('K = %4.2f\n',K_u);
fprintf('a = %4.2f\n',a2);
fprintf('b = %4.2f\n',b2);
fprintf('d = %4.2f\n',a2/b2);
fprintf('Compensated settling time = %4.2f s\n',S_c2.SettlingTime);
fprintf('Difference in settling time = %4.2f s\n',delta_ts);
fprintf('Desired error coefficient = %4.2f\n',Ki_des);
fprintf('Found error coefficient = %4.2f\n',Ki_c);


