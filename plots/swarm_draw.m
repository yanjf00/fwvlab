t = out.tout;
p_all = [out.p1 out.p2 out.p3 out.p4 out.p5];
pd_all =[out.pd1 out.pd2 out.pd3 out.pd4 out.pd5];
figure;
subplot(3,1,1);
%     plot(t,p_all(:,3*i+1),t,pd_all(:,3*i+1));

for i=0:4
    plot(t,p_all(:,3*i+1)-pd_all(:,3*i+1));
    hold on
end
ylim([-1.5,1.5]);
hold off
subplot(3,1,2);
%     plot(t,p_all(:,3*i+2),t,pd_all(:,3*i+2));
for i=0:4
    plot(t,p_all(:,3*i+2)-pd_all(:,3*i+2));
    hold on
end
ylim([-1.5,1.5]);
hold off
subplot(3,1,3);
%     plot(t,p_all(:,3*i+3),t,pd_all(:,3*i+3));
for i=0:4
    plot(t,p_all(:,3*i+3)-pd_all(:,3*i+3));
    hold on
end
ylim([-0.3,0.3]);
hold off
