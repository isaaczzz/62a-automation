% RIXS
go_S_Ka
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotNiPPh3_10mM_SKa_RIXS_11 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
rixs SNSdotNiPPh3_10mM_SKa_RIXS_12 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1


% non-resonant SKa
go_S_Ka
mv mono 2800
mv m1pitch -6.379 %non-resonant K alpha XES
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_07 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_08 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKa_2800.00eV_09 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2470.7
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_11 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_12 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_13 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_14 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2470.70eV_15 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.4
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_11 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_12 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_13 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_14 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2474.40eV_15 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_11 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_12 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_13 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_14 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotNiPPh3_10mM_SKb_2800.00eV_15 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% RIXS
go_S_Ka
mv m1pitch -6.479
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotNiPPh3_10mM_SKa_RIXS_13 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
rixs SNSdotNiPPh3_10mM_SKa_RIXS_14 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7
andorSet setShutter 0 numKins 1
