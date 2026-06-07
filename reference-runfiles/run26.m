disp('measuring samples')

close all

% Checking elastic line vs emission overlap
go_Ru_L3val
mv mono 2857.6
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_air_SiNx_RuL3val_2857.60eV_01 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1
