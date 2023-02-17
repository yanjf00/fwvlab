% Build up the system and run it!
open_system("formation.slx");
set_param("formation/Demux","Outputs", num2str(Num));

for i=1:Num
    add_block('fwv_modified/FWV',sprintf('formation/FWV%d',i),'MakeNameUnique', 'on');
    add_line('formation',sprintf('Demux/%d',i),sprintf('FWV%d/1',i));

    add_line('formation',sprintf('FWV%d/RConn1',i),'Env/LConn1');
    add_line('formation',sprintf('FWV%d/RConn2',i),'Env/LConn2');

    set_param(sprintf('formation/FWV%d/Body',i),'p0',sprintf('[%f,%f,%f]',q0(i,1),q0(i,2),q0(i,3)));
    set_param(sprintf('formation/FWV%d/Body',i),'psi0',string(q0(i,4)));
    
    set_param(sprintf('formation/FWV%d/Visualization/To Workspace',i),'VariableName',sprintf('p%d',i));
    set_param(sprintf('formation/FWV%d/Visualization/To Workspace1',i),'VariableName',sprintf('pd%d',i));
end
