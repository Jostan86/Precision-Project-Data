clc
clf
T = readtable("tree_data_2.xlsx");
tree_data = table2array(T);
tree_number = T(:,"tree_num");



subplot(2,1,1);

h = histogram(tree_data(:,3),linspace(1.2,3,37));
axis([1.6 3.1 0 25])
xlabel("2021 Nitrogen %");
ylabel("Number of Trees")
title("2021 Nitrogen %")

subplot(2,1,2);
histogram(tree_data(:,4), linspace(1.2,3,37));
xlabel("2020 Nitrogen %");
ylabel("Number of Trees")
title("2020 Nitrogen %")
axis([1.6 3.1 0 25])


