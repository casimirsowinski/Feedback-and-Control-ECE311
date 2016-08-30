%% ECE-311, HW-6, Problem B-7-27, 05/14/15, Casimir Sowinski
% Problem B-7-27: Consider the system shown in Figure 7–163. Draw a Bode 
% diagram of the open-loop transfer function, and determine the value of 
% the gain K such that the phase margin is 50°. What is the gain margin of 
% this system with this gain K?
% 
% <<EQN_B_7_27.PNG>>
% 
clc
clear    
%% Bode plot with margins

% Init  variables/functions
N       = 1000;                     % Number of points in vector
s       = tf('s');
% Method 1
K       = linspace(0,1,N);          % Vector of K values
G_1     = K*(s+0.1)/(s+0.5);
G_2     = 10/(s*(s+1));
OLTF    = G_1*G_2;                  % Open loop transfer function
% Method 2 with K = 1
num     = [0  0   10 1];
den     = [1 1.5 0.5 0];

tic

% Plot method 1
figure(1)
bode(OLTF(N));
title('Bode Diagram with K = 1, method 1');

% Plot method 2
figure(2)
bode(num,den);
title('Bode Diagram with K = 1, method 2');

% Produce and plot family of curves for different values of K
testVec = 1:50;
[mag,phase] = bode(OLTF);
figure(3)
mesh(K,testVec,squeeze(mag2db(mag))');
xlabel('K');
ylabel('frequency (Hz)');
zlabel('magnitude (dB)');
title('Family of Bode Diagrams with 0 < K < 1');
campos([-5.8,303,399]);

toc
tic

% Look for K such that Pm = 50 degrees
% Preallocate vector
Pm = zeros(1,N);

% Find where phase margin = 50 degrees
% Find all margins for the range of K values
for idx = 1:N    
    [Gm,Pm(idx),Wg,Wp] = margin(OLTF(idx));    
end

% Find the value and index of entry that is closest to 50
Pm              = Pm-50;
[minPm,minIdx]  = min(abs(Pm));
K_found         = K(minIdx);

% Print results
fprintf('\nK = %4.2f for Phase margin of 50 degrees\n\n',K_found);

toc

% Plot bode/margins with found K value
[GmF,PmF,WgF,WpF] = margin(OLTF(minIdx));
figure(4)
margin(OLTF(minIdx));
title1 = 'K = ';
title2 = num2str(K_found);
title3 = ', Gain margin = ';
title4 = num2str(GmF);
title5 = ', Phase margin = ';
title6 = num2str(PmF);
titleCat = horzcat(title1,title2,title3,title4,title5,title6);
title(titleCat);




