close all

% SH B2 XES *
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
mv Sx 0.2
mv Sy 0.2
mv vert 68.8

acq SHB2_SKb_2472.30eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHB2_SKb_2472.30eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
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
mv vert 69.8

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
andorSet numKins 1; andorSet setshutter 0; pause(2);
% last Sx = 2.5 at vert = 69.8


% SMe B2 XES 
% 0 0
% 0 x
% 0 0
% 0 0
% vert good range: 57.8 61.8
% vert spots: 57.8 58.8 59.8 60.8 61.8
% Sx good range:
%	-7 -5.5 at vert 57.8 
%	-7.5 -5.1 at vert 58.8
%	-7 -5 at vert 59.8
%	-7.5 -5.5 at vert 60.8 
%	-6.7 -6.3 at vert 61.8 (looks better closer to -6.3)


% add 2x here


% SH-Ag B2 XES *
% x 0
% 0 0
% 0 0
% 0 0
% vert good range: 69 to 71
% vert spots: 69 70 71
% Sx good range (in sequential order):
%	-7.4 to -6.6
%   -7.4 to -5.2
%	-7.4 to -5.6 

% resonant SKb
go_S_Kb
mv mono 2472.3
mv vert 69
mv Sx -7.4
mv Sy -7.4

acq SHAgB2_SKb_2472.30eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2472.30eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mv vert 70
mv Sx -7.4
mv Sy -7.4
acq SHAgB2_SKb_2472.30eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2474.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2474.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
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

mv vert 71
mv Sx -7.4
mv Sy -7.4
acq SHAgB2_SKb_2476.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
% last Sx = -5.9 at vert = 71


% SMe-Ag B2 XES
% 0 0
% x 0
% 0 0
% 0 0
% vert good range: 59.4 to 61.2
% vert spots: 59.4 60.4 61.4
% Sx good range (in sequential order):
%	-6.6 to -5.8
%   
%	

 
