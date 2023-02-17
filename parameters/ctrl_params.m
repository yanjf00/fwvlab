% Outer loop controller parameters
ol.Kp = [20 20 12];
ol.Kd = [10 10 6];
adpk = 15;   % quasi-sliding mode control k
adps = 1;    % quasi-sliding mode control sigma
gh = 1;      % sliding mode control h
gd = 2/3;    % sliding mode control p/q
% inner loop controller parameters
il.Kp = [0.3 0.3 0.2];
il.Kd = [0.03 0.08 0.05];