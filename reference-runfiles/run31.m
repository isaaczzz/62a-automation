disp('measuring samples')

close all
andorSet setShutter 0 numKins 1

% sample3_dry
go_Ru_La

mv Sx  -0.800
mv Sy  -0.800
rixs 03_01_RuTa0p1_air_SiNx_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2

andorSet setShutter 0 numKins 1


go_Ru_L3val
mv mono 2840.8
mv Sx  -0.800
mv Sy  -0.800
andorSet setShutter 0 numKins 1
pause(2.0)
acq 03_01_RuTa0p1_air_SiNx_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx -0.2667
mv Sy -0.2667
mv mono 2842.6

acq 03_02_RuTa0p1_air_SiNx_RuL3val_2842.6eV_01 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1
mv Sx -0.2667
mv Sy -0.2667
mv mono 2844.5
acq 03_02_RuTa0p1_air_SiNx_RuL3val_2844.5eV_01 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1

mv Sx  -0.800
mv Sy  -0.800
mv mono 2950
acq 03_01_RuTa0p1_air_SiNx_RuL3val_2950.0eV_01 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1
