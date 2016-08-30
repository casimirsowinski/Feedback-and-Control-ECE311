%% ECE-311, HW-6, Problem 2, 05/17/15, Casimir Sowinski
% Problem 2: Consider a unity feedback system with loop gain transfer 
%            function:
% 
% <<EQN_P2.PNG>>
% 
% * (a) Sketch the Bode for K = 4
% * (b) Determine the gain margin
% * (c) Determine the value of K required to provide a gain margin equal to 
%       12dB
% * (d) Determine the value of K to yield a steady state error of 25% of 
%       the magnitude A for the ramp input r = A t, t>0.
% * (e) Can the gain from (d) be utilized to yield stable closed-loop 
%       system?
% * (f) Plot the step responses of the closed-loop system for the gains 
%       from (a), (c), and (d). Comment on the time histories.

clc
clear   

%% (a) Bode Plot for K = 4

% Init  vars
N       = 1000;                             % Number of points in vector
s       = tf('s');                          % Symbol for tf
K       = 4;                                % Gain
L       = K/(s*(s+1)*(s+4));                % L(s)

% Plot bode
figure(1)
bode(L);

% Plot bode w/ asymptotes
figure(2)
asymp(L,.01,100);

%% (b) Gain Margin

% Init vars
[Gm4,Pm4,Wg4,Wp4]   = margin(L);            % Get mergins in linear space
Gm4dB               = 20*log10(Gm4);        % Convert to dB

% Plot bode with margins
figure(3)
margin(L)

% Print values
fprintf('\nGain margin:\t%4.2f, or %4.2fdB\n',Gm4,Gm4dB);
fprintf('Phase margin:\t%4.2f degrees\n',Pm4);

%% (c) Find K such that gain margin is 12dB

% Init vars
KVec    = linspace(0,5,N);                  % Vector of K values
LVec    = KVec*L;                           % Vector of transfer functions
GmVec   = zeros(1,N);                       % Preallocate vector for gain margins

tic

% Find where gain margin = 12dB
% Find all margins for the range of K values
for idx = 1:N    
    [GmVec(idx),Pm,Wg,Wp] = margin(LVec(idx));    
end

% Convert GmVec to dB
GmVecdB         = 20*log10(GmVec);

% Find the value and index of entry that is closest to 12
GmVecdBOffset   = GmVecdB-12;
[minGm,minIdx]  = min(abs(GmVecdBOffset));
K_found         = KVec(minIdx);

% Print results
fprintf('\nK = %4.2f for Gain margin of 12dB\n\n',K_found);

toc

% Plot bode/margins with found K value
[Gm12,Pm12,Wg12,Wp12] = margin(LVec(minIdx));
Gm12dB          = 20*log10(Gm12);           % Convert to dB
figure(4)
margin(LVec(minIdx));
title1 = 'K = ';
title2 = num2str(K_found);
title3 = ', Gain margin = ';
title4 = num2str(Gm12dB);
title5 = 'dB, Phase margin = ';
title6 = num2str(Pm12);
title7 = ' degrees';
titleCat = horzcat(title1,title2,title3,title4,title5,title6,title7);
title(titleCat);

%% (f) Plot the step responses of the closed-loop system for found gains 
%      Plot the step responses of the closed-loop system for the gains 
%      from (a), (c), and (d). Comment on the time histories.

K_1     = 4;
K_2     = K_found;
K_3     = 16;
L_1     = K_1/(s*(s+1)*(s+4));        % From part (a)
L_2     = K_2/(s*(s+1)*(s+4));        % From part (c)
L_3     = K_3/(s*(s+1)*(s+4));        % From part (d)

CLTF_1  = L_1/(1+L_1);
CLTF_2  = L_2/(1+L_2);
CLTF_3  = L_3/(1+L_3);

figure(5)
step(CLTF_1,'r');
hold on
step(CLTF_2,'b');
hold on
step(CLTF_3,'g');
hold off
legend('k = 4','k = 1.26','k = 16')
title('Step response for different K''s');

%%%Comments:
% The middle value, K=1.26, appears to make a critically damped system. The
% value K=16 makes a very oscillatory system. The K=4 system is somewhere
% in between.
