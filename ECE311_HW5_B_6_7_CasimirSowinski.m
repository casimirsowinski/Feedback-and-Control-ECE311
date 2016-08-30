%% ECE-311, HW-5, Problem B-6-7, 05/10/15, Casimir Sowinski
% Problem B-6-7: Plot the root loci for the system shown below. Determine
% the range of gain, K, for stability.
% 
% <<B_6_7.png>>
% 

clc
clear        

%% Method 1
numP    = 100;   
s       = tf('s');
K       = 10.5;
sysa    = K*(s+1)/(s+5);
sysb    = 2/(s^2*(s+2));
sysc    = 1;
sys1    = feedback(series(sysa,sysb),sysc);

min     = -3.68853;
x       = linspace(min,10,numP);
asp1    = tan(60*pi/180)*x-min*tan(60*pi/180);
asp2    = -1*asp1;

figure(1)
rlocus(sys1);
hold on
plot(x,asp1,'g');
hold on
plot(x,asp2,'g');
hold off

%% Method 2
K       = linspace(0,10.5,numP);
num     = [2 2];
den     = [1 7 10 0 0];
figure(2)
rlocus(num,den);







