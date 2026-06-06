
%Sample A1
mv Sx -2.9
mv Sy -2.9
mv vert 71.55

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Na2SO4_SKa_RIXS_01 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 1

% non-resonant SKa
%go_S_Ka
%mv mono 2800
%mv m1pitch -6.379 %non-res
%acq Na2SO4_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
%acq Na2SO4_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
%go_S_Kb
%mv mono 2800
%mv m1pitch -6.379 %non-res
%acq Na2SO4_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
%acq Na2SO4_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
%go_S_Kb
%mv mono 2482.7
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%acq Na2SO4_SKb_2482.70eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);


