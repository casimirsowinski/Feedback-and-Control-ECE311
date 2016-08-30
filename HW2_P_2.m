%% ECE-311, HW-2, Problem 2, 04/12/15, Casimir Sowinski
% B𤂿2. Obtain both analytically and computationally the rise time, peak 
% time, maximum overshoot, and settling time in the unit-step response of a 
% closed-loop system given by:
% $C(s)/R(S)=36/(s^2+2s+36)$
clc
clear

%% Computationally
% Initialize blocks
s       = tf('s');
sys1    = 36/(s^2+2*s+36);
%peak    = 0;                            % For finding value at t=6
%tol     = 0.01;                         % Tolerance

% Find unit-step response
[y, t] = step(sys1);

% Find first peak
i = 1;
while y(i)<=y(i+1)    
    peak = y(i+1);    
    i = i+1;
end

[m,n] = size(y);
for i=1:m
    if y(i) == max(y)
        peakIdx = i;
    end
end
 
% % Find value at t=6
% for i=1:size(t)
%     if t(i) < 6+tol && t(i) > 6-tol
%         peak = y(i);
%     end
% end

% Plot
figure(1);
h1 = plot(t,y);
hold on
h2 = plot(t(peakIdx),y(peakIdx),'r*');
h3 = line([t(peakIdx) t(peakIdx)],[0 y(peakIdx)],'color','r','LineWidth',2);
hold off
% Format plot
title('Step Repsonse');
ylabel('Amplitude');
xlabel('Time (seconds)');
%hleg1 = legend([h1 h2],'Step Response','t = 6');

% %% (f) Simulate the system with K_v = 0 to verify your results in (e).
% % Generate transfer function
% sys2    = 4/9;
% sys3    = 1/s;
% sys4    = series(sys2,sys3);
% sys5    = series(sys4,sys3);
% sys6    = feedback(sys5,1)
% 
% % Plot step-response
% figure(2);
% step(sys6);
% 
% % Plot zoomed in step-response over 4 cycles
% figure(3);
% [y_fail,t_fail] = step(sys6);
% h3 = plot(t_fail,y_fail);
% xlim([0,12*pi]);
% % Format plot
% title('Step Repsonse');
% ylabel('Amplitude');
% xlabel('Time (seconds)');
% hleg1 = legend([h1 h2],'Step Response','t = 6');

