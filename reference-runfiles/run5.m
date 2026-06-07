%% Sample: SMe B2
% x 0
% 0 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 68.4 70.0 71.2
% Sx scan spots -6.9 -6.4 -5.9

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 68.4
mv Sx -6.9
mv Sy -5.9

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 70.0

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 71.2

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB2_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);


%% Sample: SH-Ag B2
% 0 0
% x 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 61
% Sx scan spots -7.0 -6.5 -6.0

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 61 % close to the bottom; saw low emission around vert 58.6
mv Sx -7.0
mv Sy -6.0

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SHAgB2_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);


%% Sample: 2S-Ag B2
% 0 0
% 0 0
% x 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 50.6
% Sx scan spots -7.2 -6.7 -6.2

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 50.6 % close to the bottom
mv Sx -7.2
mv Sy -6.2

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs 2SAgB2_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);


%% Sample: SMe B4
% 0 0
% 0 0
% 0 0
% x 0
% Final spots from dscan vert and Sx.
% Vert scan spots 38.2 39.3 40.4
% Sx scan spots -6.5 -6.0 -5.5

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 38.2
mv Sx -6.5
mv Sy -5.5

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 39.3

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 40.4

andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs SMeB4_SKa_RIXS_09 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);
