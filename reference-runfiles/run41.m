close all

andorSet setShutter 0 numKins 1

% Ru La elastic calibration
go_Ru_La
mv mono 2545
acq  elastic_blank_cuvette_RuLa_2545.00eV_01 expTime 7 numKins 80 dark 1; pause(2)
%mv mono 2550
%acq  elastic_blank_cuvette_RuLa_2550.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
%mv mono 2555
%acq  elastic_blank_cuvette_RuLa_2555.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
%mv mono 2560
%acq  elastic_blank_cuvette_RuLa_2560.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
%mv mono 2565
%acq  elastic_blank_cuvette_RuLa_2565.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
andorSet setShutter 0 numKins 1

% Ru L3val elastic calibration
go_Ru_L3val
mv mono 2825
acq  elastic_blank_cuvette_RuL3val_2825.00eV_01 expTime 7 numKins 80 dark 1; pause(2)
%mv mono 2830
%acq  elastic_blank_cuvette_RuL3val_2830.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
%mv mono 2835
%acq  elastic_blank_cuvette_RuL3val_2835.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
%mv mono 2840
%acq  elastic_blank_cuvette_RuL3val_2840.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
%mv mono 2845
%acq  elastic_blank_cuvette_RuL3val_2845.00eV_01 expTime 7 numKins 150 dark 1; pause(2)
andorSet setShutter 0 numKins 1
