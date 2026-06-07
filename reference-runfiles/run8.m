%% Sample: 2S B4
% 0 0
% 0 x
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 59 to 61
% Sx scan spots 2.4 to 3.9

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 60
mv Sx 2.7
mv Sy 2.7

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);n
rixs 2SB4_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB4_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19



%% Sample: 2S-Ag B4
% 0 0
% x 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 59.8 (1.0 diff per beam width)
% Sx scan spots -6.9 to -5.7 (0.5 diff)

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 59.8
mv Sx -6.6
mv Sy -6.6

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB4_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB4_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19
