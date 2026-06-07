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
% RIXS
go_Ag_La

mv vert 68.8
mv Sx 1.5
mv Sy 1.5

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_AgLa_RIXS_01 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380  2 3400 5 3440 10 3480 7

% non-resonant XES
% for non-resonant use 3750 eV (just below the L1-edge)
go_Ag_L3val
mv mono 3750

mv Sx 2.0
mv Sy 2.0

acq SHAgB2_AgL3val_3750.00eV_01 expTime 7 numKins 80 dark 1; andorSet setshutter 0; pause(2);
andorSet numKins 1; andorSet setshutter 0; pause(2);



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
mv Sx -0.3
mv Sy -0.3

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_AgLa_RIXS_01 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380  2 3400 5 3440 10 3480 7




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
mv Sx -7.4
mv Sy -7.4

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_AgLa_RIXS_01 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380  2 3400 5 3440 10 3480 7



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

close all
