disp('measuring samples')

close all
andorSet setShutter 0 numKins 1


% ex situ RuOxHy

go_Ru_La
mv Sx  0.1333
mv Sy  0.1333
rixs 04_01_3mg_per_RuOxHy_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
andorSet setShutter 0 numKins 1

mv Sx  -0.400
mv Sy  -0.400
rixs 04_02_3mg_per_RuOxHy_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
andorSet setShutter 0 numKins 1
