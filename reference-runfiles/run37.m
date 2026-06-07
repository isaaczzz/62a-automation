disp('measuring samples')

close all
andorSet setShutter 0 numKins 1


% ex situ RuOxHy

go_Ru_La
mv Sx  0.5335
mv Sy  0.5335
rixs 04_01_1mg_per_RuOxHy_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
andorSet setShutter 0 numKins 1

mv Sx  -0.2665
mv Sy  -0.2665
rixs 04_02_1mg_per_RuOxHy_La_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
andorSet setShutter 0 numKins 1
