disp('measuring samples')

close all
andorSet setShutter 0 numKins 1


%%% Liquid jet sample RuH2dmpe %%%


%% RIXS %%
go_Ru_La
rixs RuH2dmpe_15mM_THF_RuLa_RIXS_04 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 7
rixs RuH2dmpe_15mM_THF_RuLa_RIXS_05 2825 1.0 2837 0.5 2838 0.25 2839.5 0.1 2844 0.25 2847 0.75 2862 2 2882 5 2892 7
andorSet setShutter 0 numKins 1


%% RXES Ru L3val %%
%go_Ru_L3val
%mv mono 2840.8 
%andorSet setShutter 0 numKins 1
%pause(2.0)
%acq RuH2dmpe_15mM_THF_RuL3val_2840.8eV_01 expTime 7 numKins 80 dark 1
%andorSet setShutter 0 numKins 1
