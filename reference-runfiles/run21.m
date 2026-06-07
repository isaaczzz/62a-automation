close all
disp('measuring samples')
%RIXS

mv vert 49.00
mv Sx -5.6
mv Sy -5.6
mvr vert 1

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo4_dilute_sucrose_MoLa_RIXS_02 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5

mv vert 38.64
mv Sx -5.54
mv Sy -5.54
mvr vert 1

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo2_dilute_sucrose_MoLa_RIXS_02 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5

andorSet setShutter 0 numKins 1
pause(2.0)

%Slices
andorSet setShutter 0 numKins 1

mv vert 50
mv Sx 3.96
mv Sy 3.96

go_Mo_L3val
mv mono 2525.75

acq Mo4_concentrated_MoL3val_2525.75eV_03 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);

mv vert 50
mvr Sx 0.5
mvr Sy 0.5

acq Mo4_concentrated_MoL3val_2525.75eV_04 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv mono 2527.5
mv vert 50
mvr Sx 0.5
mvr Sy 0.5

acq Mo4_concentrated_MoL3val_2527.5eV_03 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 50
mvr Sx -2
mvr Sy -2


acq Mo4_concentrated_MoL3val_2527.5eV_04 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv mono 2523.5
mv vert 50
mvr Sx -0.5
mvr Sy -0.5

acq Mo4_concentrated_MoL3val_2523.5eV_03 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 50
mvr Sx -0.5
mvr Sy -0.5

acq Mo4_concentrated_MoL3val_2523.5eV_04 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 51
mv Sx 3.46
mv Sy 3.46
mv mono 2527.5

acq Mo4_concentrated_MoL3val_2527.5eV_05 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

%MO2


andorSet setShutter 0 numKins 1

mv vert 41.33
mv Sx 3.79
mv Sy 3.79
mvr Sx 0.5
mvr Sy 0.5

go_Mo_L3val
mv mono 2525.75
acq Mo2_concentrated_MoL3val_2525.75eV_07 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);

mv vert 41.33
mvr Sx 0.5
mvr Sy 0.5

acq Mo2_concentrated_MoL3val_2525.75eV_08 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv mono 2527.5
mv vert 41.33
mvr Sx 0.5
mvr Sy 0.5

acq Mo2_concentrated_MoL3val_2527.5eV_03 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 41.33
mvr Sx -2
mvr Sy -2


acq Mo2_concentrated_MoL3val_2527.5eV_04 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv mono 2523.75
mv vert 41.33
mvr Sx -0.5
mvr Sy -0.5

acq Mo2_concentrated_MoL3val_2523.75eV_03 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 41.33
mvr Sx -0.5
mvr Sy -0.5

acq Mo2_concentrated_MoL3val_2523.75eV_04 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1


%PART2 

%RIXS

mv vert 49.00
mv Sx -5.6
mv Sy -5.6
mvr vert -1

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo4_dilute_sucrose_MoLa_RIXS_03 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5

mv vert 38.64
mv Sx -5.54
mv Sy -5.54
mvr vert -1

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo2_dilute_sucrose_MoLa_RIXS_03 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5

andorSet setShutter 0 numKins 1
pause(2.0)

%Slices
andorSet setShutter 0 numKins 1

mv vert 48
mv Sx 3.46
mv Sy 3.46

go_Mo_L3val
mv mono 2527.5

acq Mo4_concentrated_MoL3val_2527.5eV_06 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);

mv vert 48
mvr Sx 0.5
mvr Sy 0.5

acq Mo4_concentrated_MoL3val_2527.5eV_07 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv mono 2525.75
mv vert 48
mvr Sx 0.5
mvr Sy 0.5

acq Mo4_concentrated_MoL3val_2525.75eV_05 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 48
mvr Sx 0.5
mvr Sy 0.5


acq Mo4_concentrated_MoL3val_2525.75eV_06 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv mono 2523.5
mv vert 48
mvr Sx -2
mvr Sy -2

acq Mo4_concentrated_MoL3val_2523.5eV_05 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 48
mvr Sx -0.5
mvr Sy -0.5

acq Mo4_concentrated_MoL3val_2523.5eV_06 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 47
mv Sx 3.46
mv Sy 3.46


acq Mo4_concentrated_MoL3val_2523.5eV_07 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 47
mvr Sx 0.5
mvr Sy 0.5
mv mono 2525.75

acq Mo4_concentrated_MoL3val_2525.75eV_07 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 47
mvr Sx -1
mvr Sy -1
mv mono 2527.5

acq Mo4_concentrated_MoL3val_2527.5eV_08 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1


%MO2


andorSet setShutter 0 numKins 1

mv vert 39.33
mv Sx 3.79
mv Sy 3.79


go_Mo_L3val
mv mono 2525.75
acq Mo2_concentrated_MoL3val_2525.75eV_09 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);

mv vert 39.33
mvr Sx 0.5
mvr Sy 0.5
mv mono 2527.5

acq Mo2_concentrated_MoL3val_2527.5eV_05 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1


mv vert 39.33
mvr Sx 0.5
mvr Sy 0.5

acq Mo2_concentrated_MoL3val_2527.5eV_06 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 39.33
mvr Sx -1.5
mvr Sy -1.5
mv mono 2523.75

acq Mo2_concentrated_MoL3val_2523.75eV_05 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1


mv vert 39.33
mvr Sx -0.5
mvr Sy -0.5

acq Mo2_concentrated_MoL3val_2523.75eV_06 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 36.09
mv Sx 3.79
mv Sy 3.79
mv mono 2525.75

acq Mo2_concentrated_MoL3val_2525.75eV_10 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 36.09
mvr Sx 0.5
mvr Sy 0.5
mv mono 2527.5

acq Mo2_concentrated_MoL3val_2527.5eV_07 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1


mv vert 36.09
mvr Sx -1
mvr Sy -1
mv mono 2523.75

acq Mo2_concentrated_MoL3val_2523.75eV_07 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1


%RIXS

mv vert 49.00
mv Sx -5.6
mv Sy -5.6
mvr Sx 0.5
mvr Sy 0.5

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo4_dilute_sucrose_MoLa_RIXS_04 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5

mv vert 49.00
mv Sx -5.6
mv Sy -5.6
mvr Sx -0.5
mvr Sy -0.5

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo4_dilute_sucrose_MoLa_RIXS_05 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5

mv vert 38.64
mv Sx -5.54
mv Sy -5.54
mvr Sx 0.5
mvr Sy 0.5

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo2_dilute_sucrose_MoLa_RIXS_04 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5


mv vert 38.64
mv Sx -5.54
mv Sy -5.54
mvr Sx -0.5
mvr Sy -0.5

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo2_dilute_sucrose_MoLa_RIXS_05 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 5


andorSet setShutter 0 numKins 1
pause(2.0)


