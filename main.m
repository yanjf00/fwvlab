rp = 0.08;
cp = 0.02;
R=0.14;
Rw=0.15;
xr=0.01;
S=0.005;
c_bar = S/R;
r00 = integral(@(x)f(x),0,1);
r11 = integral(@(x)x.*f(x),0,1);
r22 = integral(@(x)(x.^2).*f(x),0,1);
r33 = integral(@(x)(x.^3).*f(x),0,1);
r_cp = Rw*r33/r22;
A_L = 1.8;
C_D0 = 0.45;
A_D = 1.5;
rho = 1.205;
function y=f(x)

  y=0.*(x>=0 & x<=1/15)+(x.*10.5-0.7).*(x>1/15 & x<=3/15)+(1.575-x.*0.875).*(x>3/15 & x<=1);

end