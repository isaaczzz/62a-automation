%Sample A2
mv Sx -2.7
mv Sy -2.7
mv vert 62.7

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_7_SKa_2800.00eV_01 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_7_SKa_2800.00eV_02 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_7_SKa_2800.00eV_03 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_7_SKb_2800.00eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_7_SKb_2800.00eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_7_SKb_2800.00eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.52
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_7_SKb_2470.52eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_7_SKb_2470.52eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_7_SKb_2470.52eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2471.66
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_7_SKb_2471.66eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_7_SKb_2471.66eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 1.2
mvr Sy 1.2
acq BIP_7_SKb_2471.66eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2472.85
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_7_SKb_2472.85eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_7_SKb_2472.85eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_7_SKb_2472.85eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.62
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_7_SKb_2474.62eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 0.6
mvr Sy 0.6
mvr vert 0.6
acq BIP_7_SKb_2474.62eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_7_SKb_2474.62eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);


%Sample A3
mv Sx -2.5
mv Sy -2.5
mv vert 52.3

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq Nibpybdt_SKa_2800.00eV_01 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Nibpybdt_SKa_2800.00eV_02 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Nibpybdt_SKa_2800.00eV_03 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq Nibpybdt_SKb_2800.00eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Nibpybdt_SKb_2800.00eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Nibpybdt_SKb_2800.00eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);


% resonant SKb
go_S_Kb
mv mono 2470.90
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq Nibpybdt_SKb_2470.90eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq Nibpybdt_SKb_2470.90eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq Nibpybdt_SKb_2470.90eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2473.80
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq Nibpybdt_SKb_2473.80eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq Nibpybdt_SKb_2473.80eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx -0.6
mvr Sy -0.6
mvr vert -0.6
acq Nibpybdt_SKb_2473.80eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);



%Sample A4
mv Sx -2.1
mv Sy -2.1
mv vert 41.5

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq Ptbpybdt_SKa_2800.00eV_01 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Ptbpybdt_SKa_2800.00eV_02 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Ptbpybdt_SKa_2800.00eV_03 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq Ptbpybdt_SKb_2800.00eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Ptbpybdt_SKb_2800.00eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq Ptbpybdt_SKb_2800.00eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);


% resonant SKb
go_S_Kb
mv mono 2472.30
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq Ptbpybdt_SKb_2472.30eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq Ptbpybdt_SKb_2472.30eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq Ptbpybdt_SKb_2472.30eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.10
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq Ptbpybdt_SKb_2474.10eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq Ptbpybdt_SKb_2474.10eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx -0.6
mvr Sy -0.6
mvr vert -0.6
acq Ptbpybdt_SKb_2474.10eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);



%Sample B4
mv Sx 7.0
mv Sy 7.0
mv vert 41.6

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_8_SKa_2800.00eV_01 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_8_SKa_2800.00eV_02 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_8_SKa_2800.00eV_03 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_8_SKb_2800.00eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_8_SKb_2800.00eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_8_SKb_2800.00eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.10
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_8_SKb_2470.10eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_8_SKb_2470.10eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_8_SKb_2470.10eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.90
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_8_SKb_2470.90eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_8_SKb_2470.90eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 1.2
mvr Sy 1.2
mvr vert -0.6
acq BIP_8_SKb_2470.90eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2472.85
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_8_SKb_2473.10eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_8_SKb_2473.10eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_8_SKb_2473.10eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.62
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_8_SKb_2474.20eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 0.6
mvr Sy 0.6
mvr vert 0.6
acq BIP_8_SKb_2474.20eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_8_SKb_2474.20eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);



%Sample B3
mv Sx 6.6
mv Sy 6.6
mv vert 52.3

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_9_SKa_2800.00eV_01 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_9_SKa_2800.00eV_02 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_9_SKa_2800.00eV_03 expTime 2 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
mvr vert -0.6
acq BIP_9_SKb_2800.00eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_9_SKb_2800.00eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_9_SKb_2800.00eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2469.90
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx -0.6
mvr Sy -0.6
mvr vert 0.6
acq BIP_9_SKb_2469.90eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_9_SKb_2469.90eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_9_SKb_2469.90eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.80
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert 0.6
acq BIP_9_SKb_2470.80eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_9_SKb_2470.80eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 1.2
mvr Sy 1.2
acq BIP_9_SKb_2470.80eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2473.50
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_9_SKb_2473.50eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_9_SKb_2473.50eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_9_SKb_2473.50eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.90
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_9_SKb_2474.90eV_01 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 0.6
mvr Sy 0.6
mvr vert 0.6
acq BIP_9_SKb_2474.90eV_02 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);
mvr vert 0.6
acq BIP_9_SKb_2474.90eV_03 expTime 7 numKins 20 dark 1; andorSet setshutter 0; pause(2);





run22
