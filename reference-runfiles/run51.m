disp('measuring samples')

close all
andorSet setShutter 0 numKins 1

%% Naturally occuring graphite %%

%%%%%%%%%%%%%%%%
% Na2SO4
% 0 0
% x 0
% 0 0
% 0 0

mv vert 60
mv Sx -3.5
mv Sy -3.5

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Na2SO4_80pc_sucrose_graphite_SKa_RIXS_01 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx 0.5
mvr Sy 0.5
rixs Na2SO4_80pc_sucrose_graphite_SKa_RIXS_02 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 1

mvr Sx -1.0
mvr Sy -1.0
rixs Na2SO4_80pc_sucrose_graphite_SKa_RIXS_03 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 1
andorSet numKins 1; andorSet setshutter 0; pause(2);

%% Naturally occuring graphite %%

%%%%%%%%%%%%%%%%
% Alaska
% 0 0
% 0 0
% x 0
% 0 0

mv vert 50
mv Sx -4.5
mv Sy -4.5

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Alaska_graphite_SKa_RIXS_01 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Alaska_graphite_SKa_RIXS_02 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Alaska_graphite_SKa_RIXS_03 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Alaska_graphite_SKa_RIXS_04 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv vert 49
mv Sx -4.5
mv Sy -4.5

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Alaska_graphite_SKa_RIXS_05 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Alaska_graphite_SKa_RIXS_06 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Alaska_graphite_SKa_RIXS_07 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Alaska_graphite_SKa_RIXS_08 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7


%%%%%%%%%%%%%%%%
% Greenland
% 0 x
% 0 0
% 0 0
% 0 0

mv vert 70
mv Sx 3.5
mv Sy 3.5

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Greenland_graphite_SKa_RIXS_01 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Greenland_graphite_SKa_RIXS_02 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Greenland_graphite_SKa_RIXS_03 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Greenland_graphite_SKa_RIXS_04 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv vert 71
mv Sx 3.5
mv Sy 3.5

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Greenland_graphite_SKa_RIXS_05 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Greenland_graphite_SKa_RIXS_06 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Greenland_graphite_SKa_RIXS_07 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Greenland_graphite_SKa_RIXS_08 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7


%%%%%%%%%%%%%%%%
% Ticonderoga NY
% 0 0
% 0 0
% 0 0
% 0 x

mv vert 38.5
mv Sx 3.2
mv Sy 3.2

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs TiconNY_graphite_SKa_RIXS_01 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv Sx 4.4
mv Sy 4.4
rixs TiconNY_graphite_SKa_RIXS_02 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv Sx 5.6
mv Sy 5.6
rixs TiconNY_graphite_SKa_RIXS_03 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv vert 39.5
mv Sx 3.2
mv Sy 3.2

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs TiconNY_graphite_SKa_RIXS_04 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv Sx 4.4
mv Sy 4.4
rixs TiconNY_graphite_SKa_RIXS_05 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv Sx 5.6
mv Sy 5.6
rixs TiconNY_graphite_SKa_RIXS_06 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv vert 40.5
mv Sx 3.2
mv Sy 3.2

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs TiconNY_graphite_SKa_RIXS_07 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv Sx 4.4
mv Sy 4.4
rixs TiconNY_graphite_SKa_RIXS_08 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv Sx 5.6
mv Sy 5.6
rixs TiconNY_graphite_SKa_RIXS_09 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7


%%%%%%%%%%%%%%%%
% Ruby Montana
% 0 0
% 0 x
% 0 0
% 0 0

mv vert 60
mv Sx 4.1
mv Sy 4.1

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs RubyMT_graphite_SKa_RIXS_01 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs RubyMT_graphite_SKa_RIXS_02 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs RubyMT_graphite_SKa_RIXS_03 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs RubyMT_graphite_SKa_RIXS_04 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mv vert 61
mv Sx 4.1
mv Sy 4.1

go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs RubyMT_graphite_SKa_RIXS_05 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs RubyMT_graphite_SKa_RIXS_06 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs RubyMT_graphite_SKa_RIXS_07 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs RubyMT_graphite_SKa_RIXS_08 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7


%%%%%%%%%%%%%%%%
% Tape
% 0 0
% 0 0
% 0 x
% 0 0

mv vert 50
mv Sx 4.0
mv Sy 4.0

% RIXS
go_S_Ka
andorSet numKins 1; andorSet setshutter 0; pause(2);
rixs Tape_blank_SKa_RIXS_01 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Tape_blank_SKa_RIXS_02 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Tape_blank_SKa_RIXS_03 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

mvr Sx 0.5
mvr Sy 0.5
rixs Tape_blank_SKa_RIXS_04 2463 1 2468 0.5 2470 .1 2476 .5 2483 1 2498 5 2538 7

andorSet numKins 1; andorSet setshutter 0; pause(2);

