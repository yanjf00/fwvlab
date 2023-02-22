function rel_v0 = rel_v(t)
rel_v0 = zeros(5,4);
if t>8 && t<10
    rel_v0=[0 0 -0.2*abs(t-9) 0;
        1-abs(t-9) 0 0 -pi/4+pi/4*abs(t-9);
        1-abs(t-9) 0 0 pi/4-pi/4*abs(t-9);
        0.8-0.8*abs(t-9) 0.4-0.4*abs(t-9) 0.2-0.2*abs(t-9) -pi/2+pi/2*abs(t-9);
        0.8-0.8*abs(t-9) -0.4+0.4*abs(t-9) 0.2-0.2*abs(t-9) pi/2-pi/2*abs(t-9)];
% if t>8 && t<9
%     rel_v0(4,4)=0;
%     rel_v0(5,4)=0;
% end
end