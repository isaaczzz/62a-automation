%Sample B4
mv Sx 5.8
mv Sy 5.8
mv vert 40.4

go_S_Kb
mv mono 2473.41
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_6_SKb_2473.41eV_03 expTime 7 numKins 40 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_6_SKb_2473.41eV_04 expTime 7 numKins 40 dark 1; andorSet setshutter 0; pause(2);

%Sample A2
mv Sx -2.7
mv Sy -2.7
mv vert 62.7

% resonant SKb
go_S_Kb
mv mono 2471.58
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx 0.6
mvr Sy 0.6
mvr vert -0.6
acq BIP_1_SKb_2471.58eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_1_SKb_2471.58eV_04 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

%Sample A3
mv Sx -2.5
mv Sy -2.5
mv vert 52.3

% resonant SKb
go_S_Kb
mv mono 2470.12
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx 0.6
mvr Sy 0.6
mvr vert -0.6
acq BIP_3_SKb_2470.12eV_03 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_3_SKb_2470.12eV_04 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_3_SKb_2470.12eV_05 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);


go_S_Kb
mv mono 2471.10
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_3_SKb_2471.10eV_03 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_3_SKb_2471.10eV_04 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 0.6
mvr Sy 0.6
acq BIP_3_SKb_2471.10eV_05 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);


%Sample A4
mv Sx -2.1
mv Sy -2.1
mv vert 41.5

% resonant SKb
go_S_Kb
mv mono 2471.38
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx 0.6
mvr Sy 0.6
mvr vert -0.6
acq BIP_5_SKb_2471.38eV_03 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_5_SKb_2471.38eV_04 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2471.75
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_5_SKb_2471.75eV_03 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_5_SKb_2471.75eV_04 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);


%Sample B4
mv Sx 7.0
mv Sy 7.0
mv vert 41.6

% resonant SKb
go_S_Kb
mv mono 2471.44
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx 0.6
mvr Sy 0.6
mvr vert -0.6
acq BIP_6_SKb_2471.44eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_6_SKb_2471.44eV_04 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

go_S_Kb
mv mono 2471.74
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_6_SKb_2471.74eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_6_SKb_2471.74eV_04 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);



run19



