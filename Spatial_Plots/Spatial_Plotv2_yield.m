% In this one dot size is dependant on the yield
clc
% clf
clear

cla
T = readtable("All_data.xlsx");

tree_data = table2array(T);
% 

long = tree_data(:, 8);
lat = tree_data(:, 9);
yield = tree_data(:, 7);
yield_rescale = rescale(yield, 12, 40);
for i = 1:length(long)
    if isnan(yield(i))
        continue
    end

    if yield(i) < 12000
        color = 'r';
    elseif yield(i) < 25000
        color = 'g';
    else
        color = 'b';
    end

    plot(long(i), lat(i),'.','MarkerSize', yield_rescale(i),'color',color)
    hold on
end
axis([-134.68145  -134.68075 46.2781 46.2794])
pbaspect([7 13 1])
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.r', "MarkerSize",20);
h(2) = plot(NaN,NaN,'.g', "MarkerSize",20);
h(3) = plot(NaN,NaN,'.b', "MarkerSize",20);
% grid on
title('2020 Total Yield', 'FontSize',17)
width = 320;
height = width * 13/7;

set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'XTick',[], 'YTick', [])


set(gcf,'units','points','position',[100,100,width+10,height+25])
set(gca, 'units','points', 'Position', [5,5,width,height])
legend(h, '< 12kg Yield ','12-25kg Yield', '> 25kg Yield', fontsize=13);
