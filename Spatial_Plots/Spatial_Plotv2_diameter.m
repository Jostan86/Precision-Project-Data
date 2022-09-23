% In this one dot size is dependant on the yield
clc
% clf

clear
subplot(1,4,2)
cla
T = readtable("All_data.xlsx");

tree_data = table2array(T);
% 

long = tree_data(:, 8);
lat = tree_data(:, 9);
trunk_area = tree_data(:, 2);
diameter = sqrt(trunk_area/pi)*2;

max_dot_diam = 40;
% Set to 0.5 to do SA, set to 1 to do diameter, or just change as desired
exageration_factor = 1;
% Set to pi to do SA, set to 1 to do diameter, or just change as desired
exageration_factor2 = 1;

scale_factor = 40/(max(diameter)/exageration_factor2) ^ exageration_factor;
diameter_rescale = (diameter./exageration_factor2).^exageration_factor * scale_factor;


for i = 1:length(long)
    if isnan(diameter(i))
        continue
    end

    if diameter(i) < 6.4
        color = 'r';
    elseif diameter(i) < 7.4
        color = 'g';
    else
        color = 'b';
    end

    plot(long(i), lat(i),'.','MarkerSize', diameter_rescale(i),'color',color)
    hold on
end
axis([-134.68145  -134.68075 46.2781 46.2794])
pbaspect([7 13 1])
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.r', "MarkerSize",20);
h(2) = plot(NaN,NaN,'.g', "MarkerSize",20);
h(3) = plot(NaN,NaN,'.b', "MarkerSize",20);

title('2020 Diameter', 'FontSize',17)
set(gca,'XTick',[], 'YTick', [])

width = 320;
height = width * 13/7;

set(gcf,'units','points','position',[100,100,width+10,height+25])
set(gca, 'units','points', 'Position', [5,5,width,height])

legend(h, '< 6.4cm','6.4 - 7.4cm', '> 7.4cm', fontsize=13);
