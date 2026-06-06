
%Sample B3
mv Sx 6.6
mv Sy 6.6
mv vert 52.3

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs BIP_4_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_4_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_4_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_4_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_4_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.21
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_4_SKb_2470.21eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_4_SKb_2470.21eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2473.47
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_4_SKb_2473.47eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_4_SKb_2473.47eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

%Sample B2
mv Sx 6.6
mv Sy 6.6
mv vert 62.0

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs BIP_2_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_2_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_2_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_2_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_2_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.76
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_2_SKb_2470.76eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_2_SKb_2470.76eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2471.69
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_2_SKb_2471.69eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_2_SKb_2471.69eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2473.10
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_2_SKb_2473.10eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_2_SKb_2473.10eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);


%Sample B1
mv Sx 6.6
mv Sy 6.6
mv vert 69

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs Sucrose_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1






run18
