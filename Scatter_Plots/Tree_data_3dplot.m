clc
clf
T = readtable("tree_data_2.xlsx");
tree_data = table2array(T);

for i = 1:length(tree_data)
    if tree_data(i,3) < 2
        color = 'r';
    elseif tree_data(i,3) < 2.4
        color = 'g';
    else
        color = 'b';
    end
    plot3(tree_data(i,6),tree_data(i,5),tree_data(i,2),'.','MarkerSize',(tree_data(i,3)-1)*20,'color',color)
    hold on
end
% plot3(tree_data(:,2),tree_data(:,5),tree_data(:,6),'o','MarkerSize',5)
zlabel("TCSA (cm^2)");
ylabel("Density");
xlabel("Volume (m^3)");
set(gca,'Ydir','reverse')
grid on

view(0, 0)
% legend('2-2.4%','< 2%', '> 2%')
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.r', "MarkerSize",20);
h(2) = plot(NaN,NaN,'.b', "MarkerSize",20);
h(3) = plot(NaN,NaN,'.g', "MarkerSize",20);


legend(h, '<2% Nitrogen ','2-2.4% Nitrogen', '>2.4% Nitrogen');