%% Sample: Sucrose pellet
% 0 0
% x 0
% 0 0
% 0 0

mv vert 59.0
mv Sx -5.6
mv Sy -5.6

andorSet setShutter 0 numKins 1
pause(2.0)

go_Mo_L3val

mv mono 2498.0
acq elastic_sucrose_100pc_pellet_MoL3val_2498.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mv mono 2508.0
acq elastic_sucrose_100pc_pellet_MoL3val_2508.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mv mono 2518.0
acq elastic_sucrose_100pc_pellet_MoL3val_2518.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mv mono 2528.0
acq elastic_sucrose_100pc_pellet_MoL3val_2528.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

andorSet numKins 1; andorSet setshutter 0; pause(2);

