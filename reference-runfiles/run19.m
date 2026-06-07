close all
disp('measuring samples')

andorSet setShutter 0 numKins 1

mv vert 49.07
mv Sx 3.96
mv Sy 3.96

go_Mo_L3val
mv mono 2525.75

%acq Mo4_concentrated_MoL3val_2525.75eV_01 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);

mv vert 49.07
mvr Sx 0.5
mvr Sy 0.5

%acq Mo4_concentrated_MoL3val_2525.75eV_02 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
%andorSet setShutter 0 numKins 1

mv mono 2527.5
mv vert 49.07
mvr Sx 0.5
mvr Sy 0.5

%acq Mo4_concentrated_MoL3val_2527.5eV_01 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
%andorSet setShutter 0 numKins 1

mv vert 49.07
mvr Sx -2
mvr Sy -2


acq Mo4_concentrated_MoL3val_2527.5eV_02 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv mono 2523.5
mv vert 49.07
mvr Sx -0.5
mvr Sy -0.5

acq Mo4_concentrated_MoL3val_2523.5eV_01 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1

mv vert 49.07
mvr Sx -0.5
mvr Sy -0.5

acq Mo4_concentrated_MoL3val_2523.5eV_02 expTime 2 numKins 120 dark 1; andorSet setshutter 0; pause(2);
andorSet setShutter 0 numKins 1
