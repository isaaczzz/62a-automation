close all
disp('measuring samples')

andorSet setShutter 0 numKins 1

mv vert 40.33
mv Sx 3.79
mv Sy 3.79

go_Mo_L3val
mv mono 2525.75
acq Mo2_concentrated_MoL3val_2525.75eV_01 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq Mo2_concentrated_MoL3val_2525.75eV_02 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq Mo2_concentrated_MoL3val_2525.75eV_03 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq Mo2_concentrated_MoL3val_2525.75eV_04 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 49.07
mv Sx 3.46
mv Sy 3.46

go_Mo_L3val
mv mono 2525.62
acq Mo4_concentrated_MoL3val_2525.62eV_01 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq Mo4_concentrated_MoL3val_2525.62eV_02 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq Mo4_concentrated_MoL3val_2525.62eV_03 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq Mo4_concentrated_MoL3val_2525.62eV_04 expTime 1 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1


%%%%%% Example Mo Measurement %%%%%%%
%mv m1pitch -6.30
%andorSet setShutter 0 numKins 1
%pause(2.0)
%go_Mo_La
%rixs CPMoITriCO3Dimer_12mMol_Toluene_MoLa_RIXS_10 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 7

%go_Mo_L3val
%mv mono 2800
%acq CPMoITriCO3Dimer_12mMol_Toluene_MoL3val_2800.00eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
