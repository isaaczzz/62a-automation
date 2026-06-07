disp('measuring samples')

close all

% RIXS
go_Ag_La
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs AgBehenate_pure_AgLa_RIXS_01 3340 2 3352 0.5 3353 0.15 3359 0.25 3363 0.5 3370 1 3380  2 3400 5 3440 10 3480 7

