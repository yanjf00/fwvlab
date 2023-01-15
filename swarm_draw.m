t = out.tout;
p_all = [out.p1 out.p2 out.p3 out.p4 out.p5];
pd_all =[out.pd1 out.pd2 out.pd3 out.pd4 out.pd5];
for i=0:4
    figure;
    subplot(3,1,1);
    plot(t,p_all(:,3*i+1),t,pd_all(:,3*i+1));
    subplot(3,1,2);
    plot(t,p_all(:,3*i+2),t,pd_all(:,3*i+2));
    subplot(3,1,3);
    plot(t,p_all(:,3*i+3),t,pd_all(:,3*i+3));
end