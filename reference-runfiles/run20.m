close all
disp('measuring samples')

mv vert 49.07
mv Sx 3.46
mv Sy 3.46
mvr vert 1

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo4_concentrated_MoLa_RIXS_01 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 7

mv vert 40.33
mv Sx 3.79
mv Sy 3.79
mvr vert 1

andorSet setShutter 0 numKins 1
pause(2.0)
go_Mo_La
rixs Mo2_concentrated_MoLa_RIXS_01 2514 0.4 2519 0.125 2528 0.2 2530.5 1  2549.5 7

andorSet setShutter 0 numKins 1
pause(2.0)

close all
