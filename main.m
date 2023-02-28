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
    try
        out = sim("formation.slx",'Stoptime','16');
        
    catch
        bdclose('formation.slx');
        exit;
    end
%     bdclose("formation");
    run("swarm_draw");
else
    % debug with the single fwv
    try
        out = sim('fwv_modified.slx','Stoptime','10');
    catch
        bdclose('fwv_modified.slx');
        exit;
    end
    smwritevideo('fwv_modified',"Video/fwv_modified","tile",4);
    run("draw");
end