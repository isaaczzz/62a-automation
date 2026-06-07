close all

disp('measuring samples')


%%%%%%%%%%%%%%%%%%%%%%%%
% Sample: Na2SO4 100 mM %
%%%%%%%%%%%%%%%%%%%%%%%%

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Na2SO4_100mMol_water_SKa_RIXS_01 2465 2 2473 1 2478 0.5 2479 0.2 2488 0.5 2496 2 2508 5 2532 1
rixs Na2SO4_100mMol_water_SKa_RIXS_02 2465 2 2473 1 2478 0.5 2479 0.2 2488 0.5 2496 2 2508 5 2532 1

% non-resonant SKa 
go_S_Ka
mv mono 2800
acq Na2SO4_100mMol_water_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq Na2SO4_100mMol_water_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
