% Some preparations before running the formation algorithm

% ---------------------------------------
%  initial state and some factors
% ---------------------------------------

Num = 5;    % number of fwv formation
% the initial state of each fwv in the formation
q0 = [0.5 0 0 0.2;
    -0.5 0 0 0;
    0.8 0.6 0 -0.6;
    -0.4 0.7 0 2.2;
    -1.2 -0.2 0 0.8];

% ---------------------------------------
%  desired formation trajectory
%  With respect to acceleration, please read or edit in file 'f_a_0.m'.
% ---------------------------------------
p0_0=[0;0;1;0];   % desired initial position
% v0_0=[1/3;0;1];   % desired initial velocity
v0_0=[0;0;0;0];   % desired initial velocity

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
% delta0_i0 = [
%     0,0,0.4,0;
%     -0.6,-0.4,0.2,0;
%     -0.6,0.4,0.2,0;
%     -1.2,-0.8,0,0;
%     -1.2,0.8,0,0
%     ];  % the initial shape destination
delta0_i0 = [
    0,0,0,0;
    0.5,0.5,0,pi/4;
    0.5,-0.5,0,-pi/4;
    -0.5,0.5,0,3*pi/4;
    -0.5,-0.5,0,-3*pi/4
    ];  % the initial shape destination

k1=12;  % converge rate
k2=6;  % damping rate
