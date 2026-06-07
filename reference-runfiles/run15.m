disp('measuring samples')

close all

% SH-Ag B2 X(A|E)S 
% 0 x
% 0 0
% 0 0
% 0 0
% vert good range: 68.8 to 70.6 
% vert spots: 68.8 69.8 70.8 
% Sx good range: (in sequential order)
%	1.5 to 3.9
%	1.5 to 3.9
%	2.1 to 3.9

% RIXS (scan 1 already acquired)
go_Ag_La

% Sx 1.5 and 2.0 already burned
mv vert 68.8
mv Sx 2.5
mv Sy 2.5

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_02 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_03 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_04 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_05 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mv vert 69.8
mv Sx 1.5
mv Sy 1.5

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_06 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_07 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_08 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
%andorSet numKins 1; andorSet setshutter 0; pause(2);
%rixs SHAgB2_AgLa_RIXS_09 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

% resonant XES
go_Ag_L3val
mv mono 3356.2

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_AgL3val_3356.20eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_AgL3val_3356.20eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mv vert 70.8
mv Sx 2.0
mv Sy 2.0

acq SHAgB2_AgL3val_3356.20eV_03expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% non-resonant XES (scan 1 already acquired)
% for non-resonant use 3750 eV (just below the L1-edge)
go_Ag_L3val
mv mono 3750

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_AgL3val_3750.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SHAgB2_AgL3val_3750.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

%mvr Sx 0.5
%mvr Sy 0.5
%acq SHAgB2_AgL3val_3750.00eV_04 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
%andorSet numKins 1; andorSet setshutter 0; pause(2);
close all


% SMe-Ag B2 XAS 
% 0 0
% 0 x
% 0 0
% 0 0
% vert good range: 57.6 to 62.4
% vert spots: 58 60 62
% Sx good range: (in sequential order)
%	-0.3 to 3.3
%	0.3 to 3.3 
%	0.3 to 2.7

% RIXS
go_Ag_La

mv vert 58
mv Sx 0.2 % Sx -0.3 already burned
mv Sy 0.2

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_02 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_03 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_04 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_05 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_06 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_07 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_08 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

% non-resonant XES
% for non-resonant use 3750 eV (just below the L1-edge)
go_Ag_L3val
mv mono 3750

mv vert 58
mv Sx 0.3
mv Sy 0.3

acq SMeAgB2_AgL3val_3750.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeAgB2_AgL3val_3750.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq SMeAgB2_AgL3val_3750.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all



% 2S-Ag B2 XAS 
% x 0
% 0 0
% 0 0
% 0 0
% vert good range: 68.8 to 70 
% vert spots: 68.8 69.8 70.8(?)
% Sx good range: (in sequential order)
%	-7.4 to -5 
%	-7.4 to -5
%	-7.4 to -5.5 

% RIXS
go_Ag_La

mv vert 68.8
mv Sx -6.9 % Sx -7.4 already burned
mv Sy -6.9

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_02 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_03 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_04 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_05 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_06 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mv vert 69.8
mv Sx -7.4
mv Sy -7.4

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_07 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_08 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

% resonant XES
go_Ag_L3val
mv mono 3356.45

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_AgL3val_3356.45eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_AgL3val_3356.45eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_AgL3val_3356.45eV_03expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

% non-resonant XES
% for non-resonant use 3750 eV (just below the L1-edge)
go_Ag_L3val
mv mono 3750

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_AgL3val_3750.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mv vert 70.8
mv Sx -7.4
mv Sy -7.4

acq 2SAgB2_AgL3val_3750.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq 2SAgB2_AgL3val_3750.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all


% AgNO3  
% 0 0
% x 0
% 0 0
% 0 0
% vert good range: 57.6 to 60.6 
% vert spots: 58 59 60
% Sx good range: (in sequential order)
%	-7 to -5 
%	-6.5 to -5 
%	-7 to -5 

% RIXS
go_Ag_La

mv vert 58
mv Sx -7
mv Sy -7

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_01 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_02 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_03 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_04 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_05 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mv vert 59
mv Sx -6.5
mv Sy -6.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_06 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_07 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgNO3_AgLa_RIXS_08 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380 2 3400 5 3440 10 3480 7

% non-resonant XES
% for non-resonant use 3750 eV (just below the L1-edge)
go_Ag_L3val
mv mono 3750


mvr Sx 0.5
mvr Sy 0.5
acq AgNO3_AgL3val_3750.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mv vert 60
mv Sx -7
mv Sy -7

acq AgNO3_AgL3val_3750.00eV_02 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);

mvr Sx 0.5
mvr Sy 0.5
acq AgNO3_AgL3val_3750.00eV_03 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);
close all
