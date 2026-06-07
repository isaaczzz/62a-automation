disp('measuring samples')

close all

%go_Ru_La
% 1p5
%mv Sx 3.8
%mv Sy 1
%mv vert 61.6

%andorSet setShutter 0 numKins 1
%pause(2.0)
%rixs 01_01_RuTa0p1_air_SiNx_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
%rixs 01_01_RuTa0p1_air_SiNx_La_RIXS_02 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
%rixs 01_01_RuTa0p1_air_SiNx_La_RIXS_03 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2

go_Ru_L3val
mv mono 2840.8
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_air_SiNx_RuL3val_2840.80eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_air_SiNx_RuL3val_2840.80eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_air_SiNx_RuL3val_2840.80eV_03 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1

go_Ru_L3val
mv mono 2842.6
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_air_SiNx_RuL3val_2842.60eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_air_SiNx_RuL3val_2842.60eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_air_SiNx_RuL3val_2842.60eV_03 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1
