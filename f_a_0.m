% define the desired formation trajectory of acceleration
function a_0 = f_a_0(t)
% if t<6
    a_0 = [-exp(-3*t);0;-3*exp(-3*t)];
% else
%     a_0 = [0.5*exp(-2*(t-6));0;0];
% end