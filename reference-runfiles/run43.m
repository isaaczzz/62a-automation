close all

andorSet setShutter 0 numKins 1
% sucrose pellet
mv vert 59.0
mv Sx -4.6
mv Sy -4.6

andorSet setShutter 0 numKins 1
pause(2.0)

% Mo L3val calibration
go_Mo_L3val

mv mono 2498.0
acq elastic_sucrose_pellet_MoL3val_2498.00eV_02 expTime 7 numKins 150 dark 1; andorSet setshutter 0; pause(2);
mv mono 2508.0
acq elastic_sucrose_pellet_MoL3val_2508.00eV_02 expTime 7 numKins 150 dark 1; andorSet setshutter 0; pause(2);
mv mono 2518.0
acq elastic_sucrose_pellet_MoL3val_2518.00eV_02 expTime 7 numKins 150 dark 1; andorSet setshutter 0; pause(2);
mv mono 2528.0
acq elastic_sucrose_pellet_MoL3val_2528.00eV_02 expTime 7 numKins 150 dark 1; andorSet setshutter 0; pause(2);
mv mono 2538.0
acq elastic_sucrose_pellet_MoL3val_2538.00eV_02 expTime 7 numKins 150 dark 1; andorSet setshutter 0; pause(2);

% S Kb elastic calibration
go_S_Kb
mv mono 2455
acq elastic_sucrose_pellet_SKb_2455.00eV_01 expTime 7 numKins 150 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2465
acq elastic_sucrose_pellet_SKb_2465.00eV_01 expTime 7 numKins 150 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2475
acq elastic_sucrose_pellet_SKb_2475.00eV_01 expTime 7 numKins 150 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2485
acq elastic_sucrose_pellet_SKb_2485.00eV_01 expTime 7 numKins 150 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2495
acq elastic_sucrose_pellet_SKb_2495.00eV_01 expTime 7 numKins 150 dark 1; andorSet setShutter 0; pause(2.0);

% Ag La elastic calibration
% La1 near 2984 eV
go_Ag_La
mv mono 2950
acq elastic_sucrose_pellet_AgLa_2950.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2960
acq elastic_sucrose_pellet_AgLa_2960.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2970
acq elastic_sucrose_pellet_AgLa_2970.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2980
acq elastic_sucrose_pellet_AgLa_2980.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 2990
acq elastic_sucrose_pellet_AgLa_2990.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);

% Ag L3val elastic calibration
% L3val (Lb2,15) near 3348 eV
go_Ag_L3val
mv mono 3330
acq elastic_sucrose_pellet_AgL3val_3330.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 3340
acq elastic_sucrose_pellet_AgL3val_3340.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 3350
acq elastic_sucrose_pellet_AgL3val_3350.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 3360
acq elastic_sucrose_pellet_AgL3val_3360.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);
mv mono 3370
acq elastic_sucrose_pellet_AgL3val_3370.00eV_01 expTime 7 numKins 120 dark 1; andorSet setShutter 0; pause(2.0);

andorSet setShutter 0 numKins 1





