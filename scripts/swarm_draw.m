t = out.tout;
q_all = [out.q1 out.q2 out.q3 out.q4 out.q5];
qd_all =[out.qd1 out.qd2 out.qd3 out.qd4 out.qd5];
est_err = out.refs  - repmat(out.des,1,Num) - out.rel;

colors_traj = [255 174 185;173 216 230;152 251 152;255 215 0;238 130 238]/255;
colors_body = [178 34 34;30 144 255;34 139 34;184 134 11;160 32 240]/255;
figure;
for i=0:4
    plot3(q_all(:,4*i+1),q_all(:,4*i+2),q_all(:,4*i+3),'LineWidth',2,'Color',colors_traj(i+1,:));
    hold on
end
tmp = abs(t-8);
mid = find(tmp==min(tmp));
endi = find(t==t(end));

locplot(q_all, 1, colors_body);
locplot(q_all, mid, colors_body);
locplot(q_all, endi, colors_body);

% the shape should be "V"
plot3([q_all(mid,3*4+1), q_all(mid,1*4+1),q_all(mid,0*4+1),q_all(mid,2*4+1),q_all(mid,4*4+1)], ...
    [q_all(mid,3*4+2), q_all(mid,1*4+2),q_all(mid,0*4+2),q_all(mid,2*4+2),q_all(mid,4*4+2)], ...
   [q_all(mid,3*4+3), q_all(mid,1*4+3),q_all(mid,0*4+3),q_all(mid,2*4+3),q_all(mid,4*4+3)], '--',"LineWidth", 1.5,"Color",[0.5 0.5 0.5]);
% the shape should be "X"
plot3([q_all(endi,1*4+1), q_all(endi,0*4+1),q_all(endi,4*4+1)], ...
    [q_all(endi,1*4+2), q_all(endi,0*4+2),q_all(endi,4*4+2)], ...
   [q_all(endi,1*4+3), q_all(endi,0*4+3),q_all(endi,4*4+3)], '--',"LineWidth", 1.5,"Color",[0.5 0.5 0.5]);
plot3([q_all(endi,2*4+1), q_all(endi,0*4+1),q_all(endi,3*4+1)], ...
    [q_all(endi,2*4+2), q_all(endi,0*4+2),q_all(endi,3*4+2)], ...
   [q_all(endi,2*4+3), q_all(endi,0*4+3),q_all(endi,3*4+3)], '--',"LineWidth", 1.5,"Color",[0.5 0.5 0.5]);
hold off
zlim([0,3]);
ylim([-2,2]);
xlabel("x(m)");
ylabel("y(m)");
zlabel("z(m)");
grid on

figure;
ylms = [1.5; 1.5; 0.3; 3.2];
ylbs = {'e_x(m)', 'e_y(m)', 'e_z(m)', 'e_\psi(rad)'};
for iq=1:4
    subplot(4,1,iq);
    %     plot(t,q_all(:,3*i+1),t,qd_all(:,3*i+1));
    
    for i=0:4
        plot(t,q_all(:,4*i+iq)-qd_all(:,4*i+iq),"LineWidth", 1,"Color",colors_body(i+1,:));
        hold on
    end
    ylabel(ylbs(iq));
    ylim([-ylms(iq),ylms(iq)]);
    hold off
end
xlabel("Time(s)");
% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
figure;
ylms = [-0.1,1.5;-1,2;-0.4,0.1;-1 2];
ylbs = {'e_x(m)', 'e_y(m)', 'e_z(m)', 'e_\psi(rad)'};
for iq=1:4
    subplot(4,1,iq);
    %     plot(t,q_all(:,3*i+1),t,qd_all(:,3*i+1));
    
    for i=0:4
        plot(t,est_err(:,4*i+iq),"LineWidth", 1,"Color",colors_body(i+1,:));
        hold on
    end
    ylabel(ylbs(iq));
    ylim(ylms(iq,:));
    hold off
end
xlabel("Time(s)");


function locplot(q_all, ind, colors)
for i=0:4
    plot3(q_all(ind,4*i+1),q_all(ind,4*i+2),q_all(ind,4*i+3),'.',"Color",colors(i+1,:),"MarkerSize",20)
end
end