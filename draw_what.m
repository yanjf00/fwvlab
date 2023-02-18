table1 = out.logsout{1}.Values.left_stk.q;
table1.plot()
hold on
table2 = out.logsout{1}.Values.left_rot.q;
table2.plot()
xlim([8,8.2]);
ylim([-0.8,0.8]);