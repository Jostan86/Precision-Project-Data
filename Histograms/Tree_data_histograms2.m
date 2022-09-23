clc
clf
T = readtable("tree_data_2.xlsx");
tree_data = table2array(T);
tree_number = T(:,"tree_num");



subplot(3,1,1);

histogram(tree_data(:,3),linspace(1.2,3,37));
axis([1.2 3.1 0 30])
xlabel("2021 Nitrogen %");
ylabel("Number of Trees")
title("2021 Nitrogen %")

subplot(3,1,2);
histogram(tree_data(:,4), linspace(1.2,3,37));
xlabel("2020 Nitrogen %");
ylabel("Number of Trees")
title("2020 Nitrogen %")
axis([1.2 3.1 0 30])

subplot(3,1,3);
histogram(tree_data(:,7)./1000, linspace(0,45,37));
ylabel("Number of Trees")
xlabel("Yield (kg)");
title("2020 Total Yield")

