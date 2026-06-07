%% Sample: B-1-1 Cathode
% 0 0
% 0 0
% x 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 50.5, 48.5
% Sx scan spots -7.5, -7.0, -6.5, -6

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 50.5
mv Sx -7.0
mv Sy -6.0

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 1.0
mvr Sy 1.0
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1;

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 48.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11Cathode_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);


%% Sample: B-2-3-3 Anode
% 0 0
% 0 0
% 0 0
% x 0
% Final spots from dscan vert and Sx.
% Vert scan spots 38.0, 40.0
% Sx scan spots -7.5, -7.0, -6.5, -6

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 38.0
mv Sx -7.0
mv Sy -6.0

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 1.0
mvr Sy 1.0
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1;

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 40.0
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B233Anode_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);


%% Sample: B-1-1 Cathode+Membrane
% 0 0
% x 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 58.7, 59.6
% Sx scan spots -7.5, -7.0, -6.5, -6

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 58.7
mv Sx -7.0
mv Sy -6.0

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 1.0
mvr Sy 1.0
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1;

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 59.6
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B11CathodeMembrane_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);



%% Sample: B-1-3 Black particles + membrane
% x 0
% 0 0
% 0 0
% 0 0
% Final spots from dscan vert and Sx.
% Vert scan spots 68.4, 69.9
% Sx scan spots -7.5, -7.0, -6.5, -6

andorSet numKins 1; andorSet setshutter 0; pause(2);

% rixs

mv vert 68.4
mv Sx -7.0
mv Sy -6.0

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_01 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_02 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 1.0
mvr Sy 1.0
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_03 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1;

mvr Sx 0.5
mvr Sy 0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_04 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mv vert 69.9
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_05 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_06 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_07 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -0.5
mvr Sy -0.5
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs B13blackparticlesmembrane_SKa_RIXS_08 2463 1 2468 0.5 2469 .1 2476 .5 2483 1 2498 5 2538 1

andorSet numKins 1; andorSet setshutter 0; pause(2);

