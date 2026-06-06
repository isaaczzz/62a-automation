
%Sample A1
%mv Sx -2.9
%mv Sy -2.9
%mv vert 71.55

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs Na2SO4_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1


%Sample A2
mv Sx -2.7
mv Sy -2.7
mv vert 62.7

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs BIP_7_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1


%Sample A3
mv Sx -2.5
mv Sy -2.5
mv vert 52.3

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Nibpybdt_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1



%Sample A4
mv Sx -2.1
mv Sy -2.1
mv vert 41.5

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Ptbpybdt_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1


%Sample B4
mv Sx 7.0
mv Sy 7.0
mv vert 41.6

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs BIP_8_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1



%Sample B3
mv Sx 6.6
mv Sy 6.6
mv vert 52.3

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs BIP_9_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1



%Sample B2
mv Sx 6.6
mv Sy 6.6
mv vert 62.0

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs BIP_10_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1


%Sample B1
%mv Sx 6.6
%mv Sy 6.6
%mv vert 69

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs Sucrose_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1





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


