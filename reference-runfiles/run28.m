disp('measuring samples')

close all
andorSet setShutter 0 numKins 1

% 0P4v_in_0p5_H2SO4
go_Ru_La
mv Sx 1.7335
mv Sy 1.7335
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_La_RIXS_02 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2

andorSet setShutter 0 numKins 1


go_Ru_L3val
mv mono 2840.8
mv Sx 1.7335
mv Sy 1.7335
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2840.8eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2840.8eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 0.9335
mv Sy 0.9335
mv mono 2842.6

acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2842.6eV_01 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2842.6eV_02 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2842.6eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 1.4668
mv Sy 1.4668
mv mono 2844.5
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2844.5eV_01 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2844.5eV_02 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2844.5eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1

mv Sx 1.7335
mv Sy 1.7335
mv mono 2950
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2950.0eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2950.0eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_0p4V_RuL3val_2950.0eV_03 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1

% 1p2v_in_0p5_H2SO4
go_Ru_La 
mvr trig 1

mv Sx 1.7335
mv Sy 1.7335
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_La_RIXS_02 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2

andorSet setShutter 0 numKins 1


go_Ru_L3val
mv mono 2840.8
mv Sx 1.7335
mv Sy 1.7335
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2840.8eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2840.8eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 0.9335
mv Sy 0.9335
mv mono 2842.6

acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2842.6eV_01 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2842.6eV_02 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2842.6eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 1.4668
mv Sy 1.4668
mv mono 2844.5
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2844.5eV_01 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2844.5eV_02 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2844.5eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1

mv Sx 1.7335
mv Sy 1.7335
mv mono 2950
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2950.0eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2950.0eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p2V_RuL3val_2950.0eV_03 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1



% 1p4v_in_0p5_H2SO4
go_Ru_La
mvr trig 1

mv Sx 1.7335
mv Sy 1.7335
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_La_RIXS_02 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2

andorSet setShutter 0 numKins 1


go_Ru_L3val
mv mono 2840.8
mv Sx 1.7335
mv Sy 1.7335
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2840.8eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2840.8eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 0.9335
mv Sy 0.9335
mv mono 2842.6

acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2842.6eV_01 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2842.6eV_02 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2842.6eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 1.4668
mv Sy 1.4668
mv mono 2844.5
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2844.5eV_01 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2844.5eV_02 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2844.5eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1

mv Sx 1.7335
mv Sy 1.7335
mv mono 2950
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2950.0eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2950.0eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p4V_RuL3val_2950.0eV_03 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1

% 1p7V_in_0p5_H2SO4
go_Ru_La
mvr trig 1

mv Sx 1.7335
mv Sy 1.7335
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_La_RIXS_02 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2

andorSet setShutter 0 numKins 1


go_Ru_L3val
mv mono 2840.8
mv Sx 1.7335
mv Sy 1.7335
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2840.8eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2840.8eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 0.9335
mv Sy 0.9335
mv mono 2842.6

acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2842.6eV_01 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2842.6eV_02 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2842.6eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 1.4668
mv Sy 1.4668
mv mono 2844.5
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2844.5eV_01 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2844.5eV_02 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2844.5eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1

mv Sx 1.7335
mv Sy 1.7335
mv mono 2950
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2950.0eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2950.0eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_1p7V_RuL3val_2950.0eV_03 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1

% OCV2_in_0p5_H2SO4
go_Ru_La
mvr trig 1

mv Sx 1.7335
mv Sy 1.7335
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
rixs 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_La_RIXS_02 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2

andorSet setShutter 0 numKins 1


go_Ru_L3val
mv mono 2840.8
mv Sx 1.7335
mv Sy 1.7335
andorSet setShutter 0 numKins 1
pause(2.0)
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2840.8eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2840.8eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 0.9335
mv Sy 0.9335
mv mono 2842.6

acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2842.6eV_01 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2842.6eV_02 expTime 7 numKins 80 dark 1
acq 01_02_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2842.6eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1
mv Sx 1.4668
mv Sy 1.4668
mv mono 2844.5
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2844.5eV_01 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2844.5eV_02 expTime 7 numKins 80 dark 1
acq 01_03_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2844.5eV_03 expTime 7 numKins 80 dark 1
andorSet setShutter 0 numKins 1

mv Sx 1.7335
mv Sy 1.7335
mv mono 2950
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2950.0eV_01 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2950.0eV_02 expTime 7 numKins 80 dark 1
acq 01_01_RuTa0p1_0p5_H2SO4_SiNx_OCV2_RuL3val_2950.0eV_03 expTime 7 numKins 80 dark 1

andorSet setShutter 0 numKins 1

