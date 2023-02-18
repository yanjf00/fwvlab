% define the desired formation trajectory of acceleration
function a_0 = f_a_0(t)
% a_0 = [-exp(-3*t);0;-3*exp(-3*t)];
a_0 = [0; 0; 0];
if t>0 && t<1
    a_0 = [0.4*(1-t); 0; 0.2*(1-t)];
elseif t>8 && t<10
    a_0 = [0.1*(t-10);0;1.2*(9-t)];
end