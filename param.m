% Constant of aero
A_D = 1.5;
A_L = 1.8;
C_D0 = 0.45;
% Param of Wing
xr = 0.0075;
R = 0.0675;
Rw = 0.075;
S = 0.00216*pi/4;
c_bar = S/R;
syms x curv(x)
r00 = 1;
r11 = double(int(curv(x)*(x+1/9),0,1));
r22 = double(int(curv(x)*(x+1/9)^2,0,1));
r33 = double(int(curv(x)*(x+1/9)^3,0,1));
r_cp = Rw*r33/r22;
rho = 1.205;
z00 = double(int(curv(x)^2,0,1));
z11 = double(int(curv(x)^2*(x+1/9),0,1));
z22 = double(int(curv(x)^2*(x+1/9)^2,0,1));
zrd = double(int(curv(x)^4,0,1));

% Param of body
ht = 4;

%Param of movement
f=37.5;
function y=curv(x)
y=sqrt((4/pi)^2*(1-x^2));
end