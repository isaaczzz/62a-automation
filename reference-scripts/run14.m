% Pd La RIXS
%go_Pd_La
%mv m1pitch -6.379 %non-res
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs SNSdotPdPPh3_20mM_PdLa_RIXS_02 3160 2 3172 0.5 3174 0.25 3175 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs SNSdotPdPPh3_20mM_PdLa_RIXS_03 3160 2 3172 0.5 3174 0.25 3175 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs SNSdotPdPPh3_20mM_PdLa_RIXS_04 3160 2 3172 0.5 3174 0.25 3175 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs SNSdotPdPPh3_20mM_PdLa_RIXS_05 3160 2 3172 0.5 3174 0.25 3175 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3

% Pd L3val RIXS
go_Pd_L3val
mv m1pitch -6.379 %non-res
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_01 3160 2 3172 0.5 3174 0.25 3175 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_02 3160 2 3172 0.5 3174 0.25 3175 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_03 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_04 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_05 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3


% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_06 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_07 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_08 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_09 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);


% resonant SKb
go_S_Kb
mv mono 2471.4
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_09 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_11 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_12 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_13 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.0
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_06 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_07 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_08 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_09 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_10 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);


% Pd La RIXS
go_Pd_La
mv m1pitch -6.379 %non-res
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdLa_RIXS_06 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdLa_RIXS_07 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdLa_RIXS_08 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);

% Pd L3val RIXS
go_Pd_L3val
mv m1pitch -6.379 %non-res
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_06 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_07 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_08 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_09 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_10 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3

% non-resonant SKb
go_S_Kb
mv mono 2800
mv m1pitch -6.379 %non-res
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_11 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_12 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_13 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_14 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2800.00eV_15 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);


% resonant SKb
go_S_Kb
mv mono 2471.4
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_14 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_15 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_16 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_17 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2471.40eV_18 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% resonant SKb
go_S_Kb
mv mono 2474.0
mv m1pitch -6.479 %Sulfur RIXS + resonant XES
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_11 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_12 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_13 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_14 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
acq SNSdotPdPPh3_20mM_SKb_2474.00eV_15 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);

% Pd La RIXS
go_Pd_La
mv m1pitch -6.379 %non-res
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdLa_RIXS_09 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdLa_RIXS_10 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdLa_RIXS_11 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);

% Pd L3val RIXS
go_Pd_L3val
mv m1pitch -6.379 %non-res
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_11 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_12 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_13 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_14 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SNSdotPdPPh3_20mM_PdL3val_RIXS_15 3160 2 3172 0.5 3174 0.25 3176 .15 3179 0.25 3181 0.5 3186 1 3202 2 3210 5 3300 3
