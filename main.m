%  Entrance of the platform

% single FWV or formation

addpath("models");
addpath("parameters");
addpath("scripts");
run("sim_params");
run("ctrl_params");

if ~exist("IS_FORMATION","var") || IS_FORMATION
    run("swarm_params");
    run("add_fwv");
    out = sim("formation.slx",'Stoptime','16');
    bdclose("formation");
    run("swarm_draw");
else
    % debug with the single fwv
    out = sim('fwv_modified.slx','Stoptime','10');
    smwritevideo('fwv_modified',"Video/fwv_modified","tile",4);
    run("draw");
end