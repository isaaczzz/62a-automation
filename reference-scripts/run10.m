% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotNiPPh3_10mM_SKa_RIXS_03 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
rixs SNSdotNiPPh3_10mM_SKa_RIXS_04 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1


% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-resonant K alpha XES
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.7
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_05 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.4
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_05 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotNiPPh3_10mM_SKa_RIXS_05 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
rixs SNSdotNiPPh3_10mM_SKa_RIXS_06 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_05 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotNiPPh3_10mM_SKa_RIXS_05 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
rixs SNSdotNiPPh3_10mM_SKa_RIXS_06 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1

% resonant SKb
go_S_Kb
mv mono 2470.7
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_06 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_07 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_08 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_09 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.4
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_06 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_07 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_08 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_09 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotNiPPh3_10mM_SKa_RIXS_07 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
rixs SNSdotNiPPh3_10mM_SKa_RIXS_08 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_06 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_07 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_08 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_09 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-resonant K alpha XES
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_05 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_06 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotNiPPh3_10mM_SKa_RIXS_09 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
rixs SNSdotNiPPh3_10mM_SKa_RIXS_10 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
