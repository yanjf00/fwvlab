t = out.tout;
p_all = [out.p1 out.p2 out.p3 out.p4 out.p5];
pd_all =[out.pd1 out.pd2 out.pd3 out.pd4 out.pd5];
psi_all = [out.psi1 out.psi2 out.psi3 out.psi4 out.psi5];
psid_all = [out.psid1 out.psid2 out.psid3 out.psid4 out.psid5];

colors_traj = [255 174 185;173 216 230;152 251 152;255 215 0;238 130 238]/255;
colors_body = [178 34 34;30 144 255;34 139 34;184 134 11;160 32 240]/255;
figure;
for i=0:4
    plot3(p_all(:,3*i+1),p_all(:,3*i+2),p_all(:,3*i+3),'LineWidth',2,'Color',colors_traj(i+1,:));
    hold on
end
tmp = abs(t-8);
mid = find(tmp==min(tmp));
endi = find(t==t(end));

locplot(p_all, 1, colors_body);
locplot(p_all, mid, colors_body);
locplot(p_all, endi, colors_body);

% the shape should be "V"
plot3([p_all(mid,10), p_all(mid,4),p_all(mid,1),p_all(mid,7),p_all(mid,13)], ...
    [p_all(mid,11), p_all(mid,5),p_all(mid,2),p_all(mid,8),p_all(mid,14)], ...
   [p_all(mid,12), p_all(mid,6),p_all(mid,3),p_all(mid,9),p_all(mid,15)], '--',"LineWidth", 1.5,"Color",[0.5 0.5 0.5]);
% the shape should be "X"
plot3([p_all(endi,1*3+1), p_all(endi,0*3+1),p_all(endi,4*3+1)], ...
    [p_all(endi,1*3+2), p_all(endi,0*3+2),p_all(endi,4*3+2)], ...
   [p_all(endi,1*3+3), p_all(endi,0*3+3),p_all(endi,4*3+3)], '--',"LineWidth", 1.5,"Color",[0.5 0.5 0.5]);
plot3([p_all(endi,2*3+1), p_all(endi,0*3+1),p_all(endi,3*3+1)], ...
    [p_all(endi,2*3+2), p_all(endi,0*3+2),p_all(endi,3*3+2)], ...
   [p_all(endi,2*3+3), p_all(endi,0*3+3),p_all(endi,3*3+3)], '--',"LineWidth", 1.5,"Color",[0.5 0.5 0.5]);
hold off
zlim([-0,3]);
xlabel("x(m)");
ylabel("y(m)");
zlabel("z(m)");
grid on

figure;
subplot(4,1,1);
%     plot(t,p_all(:,3*i+1),t,pd_all(:,3*i+1));

for i=0:4
    plot(t,p_all(:,3*i+1)-pd_all(:,3*i+1),"LineWidth", 1.5,"Color",colors_traj(i+1,:));
    hold on
end
ylabel("e_x(m)");
ylim([-1.5,1.5]);
hold off


subplot(4,1,2);
%     plot(t,p_all(:,3*i+2),t,pd_all(:,3*i+2));
for i=0:4
    plot(t,p_all(:,3*i+2)-pd_all(:,3*i+2),"LineWidth", 1.5,"Color",colors_traj(i+1,:));
    hold on
end
ylabel("e_y(m)");
ylim([-1.5,1.5]);
hold off


subplot(4,1,3);
%     plot(t,p_all(:,3*i+3),t,pd_all(:,3*i+3));
for i=0:4
    plot(t,p_all(:,3*i+3)-pd_all(:,3*i+3),"LineWidth", 1.5,"Color",colors_traj(i+1,:));
    hold on
end
ylabel("e_z(m)");
ylim([-0.3,0.3]);
hold off

subplot(4,1,4);
%     plot(t,p_all(:,3*i+3),t,pd_all(:,3*i+3));
for i=0:4
    plot(t,psi_all(:,i+1)-psid_all(:,i+1),"LineWidth", 1.5,"Color",colors_traj(i+1,:));
    hold on
end
xlabel("Time(s)");
ylabel("e_{\psi}(rad)");
ylim([-3.2,3.2]);
hold off

function locplot(p_all, ind, colors)
for i=0:4
    plot3(p_all(ind,3*i+1),p_all(ind,3*i+2),p_all(ind,3*i+3),'.',"Color",colors(i+1,:),"MarkerSize",20)
end
end