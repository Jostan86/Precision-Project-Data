% In this one dot size is dependant on the yield
clc
clf
clear

T = readtable("All_data.xlsx");

tree_data = table2array(T);
% 

long = tree_data(:, 8);
lat = tree_data(:, 9);
n_change = tree_data(:, 3)-tree_data(:, 4);
n_change_rescale = rescale(abs(n_change), 6, 40);
% n_change_rescale = abs(n_change) * 40;
for i = 1:length(long)
    if isnan(n_change(i))
        continue
    end

    if n_change(i) < 0
        color = 'b';

    else

        color = 'g';
    end

    plot(long(i), lat(i),'.','MarkerSize', n_change_rescale(i),'color',color)
    hold on
end
axis([-134.68145  -134.68075 46.2781 46.2794])
pbaspect([7 13 1])
h = zeros(2, 1);
h(1) = plot(NaN,NaN,'.b', "MarkerSize",20);
h(2) = plot(NaN,NaN,'.g', "MarkerSize",20);

title('Nitrogen Change 2020 - 2021', 'FontSize',17)

width = 320;
height = width * 13/7;

set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'XTick',[], 'YTick', [])

set(gcf,'units','points','position',[100,100,width+10,height+25])
set(gca, 'units','points', 'Position', [5,5,width,height])

legend(h, 'N decreased', 'N increased', fontsize=13);