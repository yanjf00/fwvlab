% define the desired formation trajectory of acceleration
function a_0 = f_a_0(t)
% a_0 = [-exp(-3*t);0;-3*exp(-3*t)];
a_0 = [0; 0; 0; 0];
t_forward_beg = 4;
t_forward_trans = 2;
t_cruise_beg = 12;
t_cruise_trans = 2;
% if t>0 && t<1
%     a_0 = [0.4*(1-t); 0; 0.2*(1-t)];
% elseif t>8 && t<10
%     a_0 = [0.1*(t-10);0;1.2*(9-t)];
% end
if t>t_forward_beg && t<t_forward_beg+t_forward_trans
    a_0 = [0.4*(t_forward_beg+t_forward_trans-t);
        -1.2*(t_forward_beg+t_forward_trans/2-t);
        0.1*(t_forward_beg+t_forward_trans-t);0];
elseif t>t_cruise_beg
    a_0 = [-0.8*sin(t-t_cruise_beg);0.8*cos(t-t_cruise_beg);0;0];
    if t<t_cruise_beg + t_cruise_trans
        a_0(3) = -0.1*(t_cruise_beg + t_cruise_trans-t);
        a_0(4) = 0.5*(t_cruise_beg + t_cruise_trans-t);
    end
end