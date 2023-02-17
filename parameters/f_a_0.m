% define the desired formation trajectory of acceleration
function a_0 = f_a_0(t)
a_0 = [-exp(-3*t);0;-3*exp(-3*t)];
if t>8 && t<10
    a_0 = [0;0;-1.2*(t-9)];
end