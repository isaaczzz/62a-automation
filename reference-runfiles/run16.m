close all
disp('measuring samples')

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo4_dilute_sucrose_MoLa_RIXS_01 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 7

mv vert 38.64

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo2_dilute_sucrose_MoLa_RIXS_01 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 7

andorSet setShutter 0 numKins 1
pause(2.0)

close all


%%%%%% Example Mo Measurement %%%%%%%
%mv m1pitch -6.30
%andorSet setShutter 0 numKins 1
%pause(2.0)
%go_Mo_La
%rixs CPMoITriCO3Dimer_12mMol_Toluene_MoLa_RIXS_10 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 7

%go_Mo_L3val
%mv m1pitch -6.22 
%mv mono 2800
%acq CPMoITriCO3Dimer_12mMol_Toluene_MoL3val_2800.00eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
