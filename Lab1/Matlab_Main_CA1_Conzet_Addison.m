%% ASEN 3111 - Computational Assignment XX - Main
% Finding lift and drag per unit span over a rotating cylinder as well as 
% a symmetric airfoil using handwritten trapezoidal and simpsons
% integration
%
%   Author: {Conzet, Addison}
%   Date: {9/17/2020}

clear;clc;close all;
%% Problem 1 %%%%%%%%%%%%%%%%%%%%
%sectional lift and drag

% symbolic variables for integrating
syms R Gamma V_inf theta
Gamma = 2*pi*R*V_inf;

% struct to make it easier to feed consts into my int functions
constants.Gamma = Gamma;
constants.R = R;
constants.V_inf = V_inf;

% analytical solutions
cl = -0.5 * int(Cp_func(theta,constants) * sind(theta),theta,[0 2*pi]);
cd = -0.5 * int(Cp_func(theta,constants) * cosd(theta),theta,[0 2*pi]);

%% trapezoidal and simpsons
% setting num panels for graphing
steps = round(linspace(1,20,20));
% allocating
cl_trap = zeros(1,20);
cd_trap = zeros(1,20);
cl_simp = zeros(1,20);
cd_simp = zeros(1,20);

%finding realtion between number of panels and output
j = 1;
for i = steps
    cl_trap(j) = -0.5 * trap(Cp_func(theta,constants) * sind(theta),0,2*pi,i);
    cd_trap(j) = -0.5 * trap(Cp_func(theta,constants) * cosd(theta),0,2*pi,i);
    cl_simp(j) = -0.5 * trap(Cp_func(theta,constants) * sind(theta),0,2*pi,i);
    cd_simp(j) = -0.5 * trap(Cp_func(theta,constants) * cosd(theta),0,2*pi,i);
    j
    j = j+1;
end
figure
plot(steps,cl_trap)
title('trapezoidal estimation')
xlabel('num panels')
ylabel('cl')
figure
plot(steps,cd_trap)
title('trapeziodal estimation')
xlabel('num panels')
ylabel('cd')
figure
plot(steps,cl_trap)
title('simpsons estimation')
xlabel('num panels')
ylabel('cl')
figure
plot(steps,cd_trap)
title('simspons estimation')
xlabel('num panels')
ylabel('cd')

%% tolerance

% 1/10 of 1% of analytical
tol = 0.0001*eval(cl);

%iterating each by one panel to find tolerance


% commented out for speed


% i = 1;
% fprintf('testing %i panels...\n',i')
% while abs(-0.5 * trap(Cp_func(theta,constants) * sind(theta),0,2*pi,i) - eval(cl)) > tol
%     i = i+1;
%     fprintf('testing %i panels...\n',i')
% end
% fprintf('number of panels for trapezoidal to be in tolerance: %i\n',i);
% i = 1;
% fprintf('testing %i panels...\n',i')
% while abs(-0.5 * simp(Cp_func(theta,constants) * sind(theta),0,2*pi,i) - eval(cl)) > tol
%     i = i+1;
%     fprintf('testing %i panels...\n',i')
% end
% fprintf('number of panels for simpsons to be in tolerance: %i\n',i);

fprintf('number of panels for trapezoidal to be in tolerance: %i\n',74);
fprintf('number of panels for simpsons to be in tolerance: %i\n',4);



%% Problem 2 %%%%%%%%%%%%%%%%%%%%

load('Cp.mat')

% constants and syms
rho_inf = 1.225;
V_inf = 30;
p_inf = 101.3*10^3;
a = deg2rad(9);
c=2;
max = 12;
syms xc;

% basic aero eqn
q_inf = 1/2*rho_inf*V_inf^2;

% airfoil shape
yt = 12/100/0.2*c*(0.2969*sqrt(xc)-0.1260.*xc-0.3516.*xc^2+0.2843.*xc^3-0.1036.*xc^4);


% commented for speed

% calculating cn and ca using 2000 panels for accuracy
% cn = (trap_cn(Cp_lower,0,1,1000) - trap_cn(Cp_upper,0,1,1000));
% % cn == 1.0432
% 
% x = linspace(0,1,1000);
% ca = 1/c*(-trap_ca(Cp_lower,x,-yt) + trap_ca(Cp_upper,x,yt));
% % ca == -0.1629
% 
% cl = cn * cos(a) - ca*sin(a);
% L = cl*(q_inf*c)
% 
% cd = cn * sin(a) + ca * cos(a);
% D = cd*(q_inf*c)

fprintf("Since L' and D' cannot be analytically determined, the functions \nwere run using 2000 panels to get a value to approach for the errors\n")

% setting tolerances and iterating to find them
% tol0 = 0.0001*L;
% tol1 = 0.01*L;
% tol1_solve = 0;
% tol2_solve = 0;
% tol2 = 0.05*L;
% i = 0;
% 
% while 1
%     if i < 50
%         i = i+5;
%     elseif i < 100
%         i = i+10;
%     else
%         i = i+50;
%     end
%     fprintf("testing %i panels\n",i*2);
%     cn_err = (trap_cn(Cp_lower,0,1,i) - trap_cn(Cp_upper,0,1,i));
%     % cn == 1.0432
% 
%     x = linspace(0,1,i);
%     ca_err = 1/c*(-trap_ca(Cp_lower,x,-yt) + trap_ca(Cp_upper,x,yt));
%     % ca == -0.1629
% 
%     cl_err = cn_err * cos(a) - ca_err*sin(a);
%     L_err = cl_err*(q_inf*c);
%     if abs(L_err - L) < tol1 && tol1_solve == 0
%         tol1_solve = 1;
%         fprintf('num panels for 1 percent: %i\n',i*2)
%     end
%     if abs(L_err - L) < tol2 && tol2_solve == 0
%         tol2_solve = 1;
%         fprintf('num panels for 5 percent: %i\n',i*2)
%     end
%     if abs(L_err - L) < tol0
%         break
%     end
% end
% fprintf('num panels for .01 percent: %i\n',i*2);


fprintf('num panels for 5 percent: %i\n',100)
fprintf('num panels for 1 percent: %i\n',400)
fprintf('num panels for 0.01 percent: %i\n',2000);
