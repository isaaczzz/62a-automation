 % SKb elastic scattering
mv Sx 6.6
mv Sy 6.6
mv vert 69

go_S_Kb
mv m1pitch -6.479 %resonant XES

mv mono 2455
acq elastic_sucrose_SKb_2455.00eV_01 expTime 7 numKins 300 dark 1; andorSet setShutter 0; pause(2.0);

mv mono 2465
acq elastic_sucrose_SKb_2465.00eV_01 expTime 7 numKins 300 dark 1; andorSet setShutter 0; pause(2.0);

mv mono 2475
acq elastic_sucrose_SKb_2475.00eV_01 expTime 7 numKins 300 dark 1; andorSet setShutter 0; pause(2.0);

mv mono 2485
acq elastic_sucrose_SKb_2485.00eV_01 expTime 7 numKins 300 dark 1; andorSet setShutter 0; pause(2.0);

