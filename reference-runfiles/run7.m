%% Sample: 2S B2 (updated)
% x 0
% 0 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 67.6 68.6 69.6 (1.0 diff per beam width)
% Sx scan spots -7.2 -6.7 -6.2 (0.5 diff) 

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 67.6
mv Sx -7.2
mv Sy -7.2

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 68.6

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 69.6

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SB2_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19



%% Sample: SH-Ag B2 (second run updated)
% 0 0
% x 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 59.2 60.2 61.2
% Sx scan spots -6.8 -6.3 -5.8

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 59.2
mv Sx -6.8
mv Sy -6.8

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 60.2

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 61.2

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_10 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_11 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_12 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19



%% Sample: 2S-Ag B2 (second run updated)
% 0 0
% 0 0
% x 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 48.6 49.6 50.6
% Sx scan spots -6.9 -6.4 -5.9

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 48.6
mv Sx -6.9
mv Sy -6.9

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 49.6

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 50.6

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_10 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_11 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_12 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19



%% Sample: 2S-Au B4 (updated)
% 0 0
% 0 0
% 0 0
% x 0
% Final spots from dscan vert and Sx.
% Vert scan spots 37.1 38.1 39.1 (1.0 diff per beam width)
% Sx scan spots -6.3 -5.8 -5.3 (0.5 diff) 

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 37.1
mv Sx -6.3
mv Sy -6.3

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 38.1

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 39.1

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAuB4_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19



%% Sample: SH B2 (updated)
% 0 x
% 0 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 68 69 70 (1.0 diff per beam width)
% Sx scan spots 1.4 1.9 2.4 (0.5 diff) 

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 68
mv Sx 1.4
mv Sy 1.4

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 69

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 70

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHB2_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19



%% Sample: SMe-Ag B2 (updated)
% 0 0
% 0 0
% 0 x
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 48.6 49.6 50.6 (1.0 diff per beam width)
% Sx scan spots 2.6 3.1 3.6 (0.5 diff) stopped at scanning through Sx?

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 48.6
mv Sx 2.6
mv Sy 2.6

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 49.6

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 50.6

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeAgB2_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
close all % need this otherwise process will freeze once n>19
