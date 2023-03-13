function rel_v0 = rel_v(t)
rel_v0 = zeros(5,4); 
% if t>8 && t<10
%     rel_v0=[0 0 -0.2 0;
%         1 0 0 -pi/4;
%         1 0 0 pi/4;
%         0.8 0.4 0.2 -pi/2;
%         0.8 -0.4 0.2 pi/2]*deltat(t,9,1);
% end
t_forward_beg = 4;
t_forward_trans = 1;
t_cruise_beg = 12;
t_cruise_trans = 1;

if t>t_forward_beg && t<t_forward_beg+t_forward_trans
    rel_v0=[0 0 0.2 0;
        -1.1 -0.1 0 -pi/4;
        -1.1 0.1 0 pi/4;
        -0.7 0.3 -0.2 -3*pi/4;
        -0.7 -0.3 -0.2 3*pi/4]*deltat(t,t_forward_beg,t_forward_trans/2);
end
if t>t_cruise_beg
    if t<t_cruise_beg+t_cruise_trans
        rel_v0 = ([rel_star(t_cruise_beg+t_cruise_trans,t_cruise_beg,0);
            rel_star(t_cruise_beg+t_cruise_trans,t_cruise_beg,2*pi/5);
            rel_star(t_cruise_beg+t_cruise_trans,t_cruise_beg,-2*pi/5);
            rel_star(t_cruise_beg+t_cruise_trans,t_cruise_beg,4*pi/5);
            rel_star(t_cruise_beg+t_cruise_trans,t_cruise_beg,-4*pi/5)]-[0 0 0.2 0;
        -0.6 0.4 0 0;
        -0.6 -0.4 0 0;
        -1.2 0.8 -0.2 0;
        -1.2 -0.8 -0.2 0])*deltat(t,t_cruise_beg,t_cruise_trans/2);
    else
        rel_v0 = [rel_dot_star(t,t_cruise_beg,0);
            rel_dot_star(t,t_cruise_beg,2*pi/5);
            rel_dot_star(t,t_cruise_beg,-2*pi/5);
            rel_dot_star(t,t_cruise_beg,4*pi/5);
            rel_dot_star(t,t_cruise_beg,-4*pi/5)];
    end
end
end

function delta = deltat(t,t0,interval)
delta = -abs(t-t0-interval)/interval/interval + 1/interval;
end

function rel = rel_star(t,t0,beta)
rel = [2*0.8*cos(t-t0+beta/2)*sin(beta/2) 2*0.8*sin(t-t0+beta/2)*sin(beta/2) 0 t-t0+beta];
end

function rel_dot = rel_dot_star(t,t0,beta)
rel_dot = [-2*0.8*sin(t-t0+beta/2)*sin(beta/2) 2*0.8*cos(t-t0+beta/2)*sin(beta/2) 0 0];
end