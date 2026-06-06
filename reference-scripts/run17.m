
%Sample A1
mv Sx -2.9
mv Sy -2.9
mv vert 71.55

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs Na2SO4_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq Na2SO4_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Na2SO4_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq Na2SO4_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Na2SO4_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2482.7
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq Na2SO4_SKb_2482.70eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Na2SO4_SKb_2482.70eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);




%Sample A2
mv Sx -2.7
mv Sy -2.7
mv vert 62.7

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs BIP_1_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1



% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_1_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_1_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_1_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_1_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2471.58
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_1_SKb_2471.58eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_1_SKb_2471.58eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2473.16
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_1_SKb_2473.16eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_1_SKb_2473.16eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);




%Sample A3
mv Sx -2.5
mv Sy -2.5
mv vert 52.3

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs BIP_3_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_3_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_3_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_3_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_3_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.12
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_3_SKb_2470.12eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_3_SKb_2470.12eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2471.10
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_3_SKb_2471.10eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_3_SKb_2471.10eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2473.50
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_3_SKb_2473.50eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_3_SKb_2473.50eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);


%Sample A4
mv Sx -2.1
mv Sy -2.1
mv vert 41.5

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs BIP_5_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_3_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_5_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_5_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_5_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2471.38
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_5_SKb_2471.38eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_5_SKb_2471.38eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2471.75
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_5_SKb_2471.75eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_5_SKb_2471.75eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2473.10
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_5_SKb_2473.10eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_5_SKb_2473.10eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);



%Sample B4
mv Sx 7.0
mv Sy 7.0
mv vert 41.6

% RIXS
%go_S_Ka
%mv m1pitch -6.479 %Sulfur RIXS + resonant XES
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs BIP_6_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_6_SKa_2800.00eV_01 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_6_SKa_2800.00eV_02 expTime 2 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_6_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_6_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2471.44
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_6_SKb_2471.44eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_6_SKb_2471.44eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2471.74
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_6_SKb_2471.74eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_6_SKb_2471.74eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2473.00
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_6_SKb_2473.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_6_SKb_2473.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2473.41
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_6_SKb_2473.41eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
mvr Sx -0.6
mvr Sy -0.6
mvr vert -0.6
acq BIP_6_SKb_2473.41eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

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
