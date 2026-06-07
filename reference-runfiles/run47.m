disp('measuring samples')

close all
andorSet setShutter 0 numKins 1


% Liqud jet sample RuH2dmpe

go_Ru_La
rixs RuH2dmpe_50mM_THF_RuLa_RIXS_01 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
rixs RuH2dmpe_50mM_THF_RuLa_RIXS_02 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 2
andorSet setShutter 0 numKins 1
