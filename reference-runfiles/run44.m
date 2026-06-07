close all

% Na2SO4 Ka calibration
% non-resonant SKa
go_S_Ka
mv mono 2800
acq Na2SO4_80pc_sucrosepellet_SKa_2800.00eV_01 expTime 7 numKins 40 dark 1; andorSet setshutter 0; pause(2);
acq Na2SO4_80pc_sucrosepellet_SKa_2800.00eV_02 expTime 7 numKins 40 dark 1; andorSet setshutter 0; pause(2);
acq Na2SO4_80pc_sucrosepellet_SKa_2800.00eV_03 expTime 7 numKins 40 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
