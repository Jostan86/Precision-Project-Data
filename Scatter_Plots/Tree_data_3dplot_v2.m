% This one uses rescale instead of my formula to determine the dot size,
% dot size is still dependant on nitrogen percentage
clc
clf
T = readtable("tree_data_2.xlsx");
tree_data = table2array(T);
nitrogen = tree_data(:,3);
nitrogen_mapped = rescale(nitrogen, 8, 40);
for i = 1:length(tree_data)
    if tree_data(i,3) < 2
        color = 'r';
    elseif tree_data(i,3) < 2.4
        color = 'g';
    else
        color = 'b';
    end
    plot3(tree_data(i,6),tree_data(i,5),tree_data(i,2),'.','MarkerSize',nitrogen_mapped(i), 'color',color)
    hold on
end
% plot3(tree_data(:,2),tree_data(:,5),tree_data(:,6),'o','MarkerSize',5)
zlabel("Trunk CS-Area (cm^2)");
ylabel("Density");
xlabel("Volume (m^3)");

grid on

% pause(3)
view(0, 0)
% legend('2-2.4%','< 2%', '> 2%')