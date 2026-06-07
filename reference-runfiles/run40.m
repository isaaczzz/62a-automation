disp('measuring samples')

close all
andorSet setShutter 0 numKins 1


% ex situ RuOxHy

go_Ru_La
mv Sx  -0.5334
mv Sy  -0.5334
rixs 05_01_0p4_per_RuO2_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
andorSet setShutter 0 numKins 1


go_Ru_L3val
mv mono 2840.8
andorSet setShutter 0 numKins 1
pause(2.0)
acq 05_01_0p4_per_RuO2_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1

mv mono 2842.6
acq 05_01_0p4_per_RuO2_RuL3val_2842.6eV_01 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1

mv mono 2950
acq 05_01_0p4_per_RuO2_RuL3val_2950.0eV_01 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
