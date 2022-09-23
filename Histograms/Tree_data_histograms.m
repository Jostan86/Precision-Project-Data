clc
clf
T = readtable("tree_data_2.xlsx");
tree_data = table2array(T);
tree_number = T(:,"tree_num");



subplot(3,1,1);

histogram(tree_data(:,2), linspace(20,65,19));
xlabel("TCSA (cm^2)");
ylabel("Number of Trees")
title("Trunk Cross Sectional Area  (2020 Data)")

subplot(3,1,2);
histogram(tree_data(:,5), linspace(0.35,0.85,21));
xlabel("Density");
ylabel("Number of Trees")
title("Canopy Density")

subplot(3,1,3);
histogram(tree_data(:,6), linspace(16,31,16));
ylabel("Number of Trees")
xlabel("Volume (m^3)");
title("Canopy Volume")

% subplot(4,1,4);

% histogram(tree_data(:,7), linspace(0,40000,33));
% xlabel("Total Yield (g)");
% ylabel("Number of Trees")
% title("Total Yield")