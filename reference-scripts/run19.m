%Sample B2
mv Sx 6.6
mv Sy 6.6
mv vert 62.0

% resonant SKb
go_S_Kb
mv mono 2470.76
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr Sx 0.6
mvr Sy 0.6
mvr vert -0.6
acq BIP_2_SKb_2470.76eV_03 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_2_SKb_2470.76eV_04 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_2_SKb_2470.76eV_05 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);


go_S_Kb
mv mono 2471.69
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
mvr vert -0.6
acq BIP_2_SKb_2471.69eV_03 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr vert -0.6
acq BIP_2_SKb_2471.69eV_04 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
mvr Sx 0.6
mvr Sy 0.6
acq BIP_2_SKb_2471.69eV_05 expTime 7 numKins 10 dark 1; andorSet setshutter 0; pause(2);
