% Outer loop controller parameters
ol.Kp = [20 20 12];
ol.Kd = [10 10 6];
adpk = 8;   % quasi-sliding mode control k
adps = 2;    % quasi-sliding mode control sigma
gh = 1;      % sliding mode control h
gd = 5/7;    % sliding mode control p/q
% inner loop controller parameters
il.Kp = [0.2 0.4 0.2];
il.Kd = [0.03 0.08 0.05];