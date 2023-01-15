%% Some preparations before running the formation algorithm
% ---------------------------------------
%  initial state and some factors
% ---------------------------------------
clear,clc;
Num = 5;    % number of fwv formation
% the initial state of each fwv in the formation
q0 = [0.5 0 0 0.2;-0.5 0 0 0;0.8 0.6 0 -0.6;-0.4 0.7 0 2.2;-1.2 -0.2 0 0.8];
k1=20;  % converge rate
k2=15;  % damping rate

% ---------------------------------------
%  desired formation trajectory
%  With respect to acceleration, please read or edit in file 'f_a_0.m'.
% ---------------------------------------
p0_0=[0;0;0];   % desired initial position
v0_0=[1/3;0;1];   % desired initial velocity

% ---------------------------------------
%  adjectory matrix
% ---------------------------------------
adj_matrix = [
    0 0 1 0 1;
    0 0 1 1 0;
    1 1 0 0 1;
    0 1 0 0 0;
    1 0 1 0 0;
    ];
% who can get access to the desired trajectory of the formation
is_0_access = [1 0 0 1 0];

% ----------------------------------------
%  desired shape of the formation
%  With respect to shape transformation that might happen, please read
%  or edit in file 'rel_v.m'
% ----------------------------------------
delta0_i0 = [
    0,0,0.4,0;
    -0.6,-0.4,0.2,0;
    -0.6,0.4,0.2,0;
    -1.2,-0.8,0,0;
    -1.2,0.8,0,0
    ];  % the initial shape destination



%% 22 Build up the system and run it!
open_system("formation.slx");
add_block('fwv_modified/Env','formation/Env','MakeNameUnique', 'on');

for i=1:Num
    add_block('fwv_modified/FWV',sprintf('formation/FWV%d',i),'MakeNameUnique', 'on');
    add_line('formation','Formation_Controller/1',sprintf('FWV%d/1',i));

    add_line('formation',sprintf('FWV%d/RConn1',i),'Env/LConn1');
    add_line('formation',sprintf('FWV%d/RConn2',i),'Env/LConn2');

    set_param(sprintf('formation/FWV%d/id',i),'Value',string(i));
    set_param(sprintf('formation/FWV%d/Body',i),'p0',sprintf('[%f,%f,%f]',q0(i,1),q0(i,2),q0(i,3)));
    set_param(sprintf('formation/FWV%d/Body',i),'psi0',string(q0(i,4)));
    
    set_param(sprintf('formation/FWV%d/Visualization/To Workspace',i),'VariableName',sprintf('p%d',i));
    set_param(sprintf('formation/FWV%d/Visualization/To Workspace1',i),'VariableName',sprintf('pd%d',i));
end
out = sim("formation.slx",'Stoptime','15');
% bdclose('formation');