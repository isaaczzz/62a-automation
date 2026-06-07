close all

% SH-Ag B2 (R)XES *
% x 0
% 0 0
% 0 0
% 0 0
% vert good range: 68 to 72
% vert spots: 68.5 69.5 70.5 71.5
% Sx good range (in sequential order):
%	-7.2 to -5 
%	-7.2 to -5.2 
%	-7.2 to -5.2 
% 	-7.2 to -5.6 

% resonant SKb
go_S_Kb
mv mono 2472.3
mv vert 68.5
mv Sx -7.2
mv Sy -7.2

%acq SHAgB2_SKb_2472.30eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
%acq SHAgB2_SKb_2472.30eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
%acq SHAgB2_SKb_2472.30eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474

mvr Sx 0.5
mvr Sy 0.5
%acq SHAgB2_SKb_2474.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
%acq SHAgB2_SKb_2474.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

vert 69.5
mv Sx -7.2
mv Sy -7.2
acq SHAgB2_SKb_2474.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2476

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2476.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2476.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2476.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mv vert 70.5
mv Sx -7.2
mv Sy -7.2
acq SHAgB2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all



% SMe-Ag B2 XES
% 0 0
% x 0
% 0 0
% 0 0
% vert good range: 57.8 to 61.8
% vert spots: 57.8 58.8 59.8 60.8 61.8
% Sx good range:
%	-7 -5.5 at vert 57.8 
%	-7.5 -5.1 at vert 58.8
%	-7 -5 at vert 59.8
%	-7.5 -5.5 at vert 60.8 
%	-6.7 -6.3 at vert 61.8 (looks better closer to -6.3)

% non-resonant SKb
go_S_Kb
mv mono 2800

mv vert 60.8
mv Sx -7.5
mv Sy -7.5
acq SMeAgB2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeAgB2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeAgB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeAgB2_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all



% 2S-Ag B2 (R)XES *
% 0 0
% 0 0
% x 0
% 0 0
% vert good range: 47.6 to 51.2
% vert spots: 47.6 48.6 49.6 50.6
% Sx good range: (in sequential order)
%	-6.4 to -4.3 
%	-6.7 to -4.3 
%	-7.3 to -4.3
%	-7.6 to -5

% resonant SKb
go_S_Kb
mv mono 2473.2
mv vert 47.6
mv Sx -6.4
mv Sy -6.4

acq 2SAgB2_SKb_2473.20eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2473.20eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2473.20eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.4

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2474.40eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2474.40eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mv vert 48.6
mv Sx -6.7
mv Sy -6.7
acq 2SAgB2_SKb_2474.40eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2476.5

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2476.50eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2476.50eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2476.50eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mv vert 49.6
mv Sx -7.3
mv Sy -7.3
acq 2SAgB2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all

% end of run11.m
% 2S-Au B4 XES 
% 0 0
% 0 0
% 0 0
% x 0
% vert good range: 37.2 to 41.4
% vert spots: 37.7 38.7 39.7 40.7
% Sx good range:
%	-6.6 to -4.3
%	-6.9 to -4.3
%	-6.9 to -4.3
%	-6.5 to -4.5

% non-resonant SKb
go_S_Kb
mv mono 2800

mv vert 39.7
mv Sx -6.9 % nice
mv Sy -6.9
acq 2SAuB4_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAuB4_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAuB4_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAuB4_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all



% SH B2 (R)XES *
% 0 x
% 0 0
% 0 0
% 0 0
% vert good range: 68.8 to 71.8
% vert spots: 68.8 69.8 70.8 71.8
% Sx good range (in sequential order):
%	0.2 to 3
%   0 to 3.2
%	0 to 2.8
%	0 to 3.2

% resonant SKb
go_S_Kb
mv mono 2472.3

%% already measured in cancelled run
%mv Sx 0.2 spots 1 and 2 already measured in cancelled run
%mv Sy 0.2
%mv vert 69.8
%acq SHB2_SKb_2472.30eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
%
%mvr Sx 0.5
%mvr Sy 0.5
%acq SHB2_SKb_2472.30eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
%
%mvr Sx 0.5
%mvr Sy 0.5
%% end of already measured

mv vert 69.8
mv Sx 1.2
mv Sy 1.2
acq SHB2_SKb_2472.30eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2473.5

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2473.50eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2473.50eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2473.50eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2476
mv Sx 0
mv Sy 0
mv vert 70.8

acq SHB2_SKb_2476.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2476.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2476.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mv vert 71.8
mv Sx 0
mv Sy 0
acq SHB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all


% SMe B2 XES
% 0 0
% 0 x
% 0 0
% 0 0
% vert good range: 57.6 to 61.8
% vert spots: 58 59 60 61
% Sx good range (in sequential order):
%	2.6 to 4.2 
%   2.2 to 4.2
%	2.2 to 4.2
%	2.2 to 4.2 

% non-resonant SKb
go_S_Kb
mv mono 2800

mv vert 60
mv Sx 2.2
mv Sy 2.2
acq SMeB2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeB2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeB2_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all



% 2S B2 (R)XES *
% 0 0
% 0 0
% 0 x
% 0 0
% vert good range: 47.6 to 51.8 
% vert spots: 48 49 50 51
% Sx good range (in sequential order):
%	1 to 3.8
%   1 to 3.8 
%	1 to 3.8 
%	1 to 3.8 

% resonant SKb
go_S_Kb
mv mono 2472.6
mv vert 48
mv Sx 1
mv Sy 1

acq 2SB2_SKb_2472.60eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2472.60eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2472.60eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.4

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2474.40eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2474.40eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2474.40eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2476.5

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2476.50eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2476.50eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mv vert 49
mv Sx 1
mv Sy 1
acq 2SB2_SKb_2476.50eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SB2_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all



% SH-Au B3 XES
% 0 0
% 0 0
% 0 0
% 0 x
% vert good range: 37.6  to 40.6 
% vert spots: 37.6 38.6 39.6 40.6 
% Sx good range (in sequential order):
%	3 to 4.6 
%   2.8 to 4.8
%	2.8 to 4.8
%	3.2 to 4.6

% non-resonant SKb
go_S_Kb
mv mono 2800

mv vert 39.6
mv Sx 2.8
mv Sy 2.8
acq SHAuB3_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAuB3_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAuB3_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAuB3_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all
