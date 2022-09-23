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
trunk_area_rescale = rescale(trunk_area, 8, 40);
for i = 1:length(long)
    if isnan(trunk_area(i))
        continue
    end

    if trunk_area(i) < 30
        color = 'r';
    elseif trunk_area(i) < 42
        color = 'g';
    else
        color = 'b';
    end

    plot(long(i), lat(i),'.','MarkerSize', trunk_area_rescale(i),'color',color)
    hold on
end
axis([-134.68145  -134.68075 46.2781 46.2794])
pbaspect([7 13 1])
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.r', "MarkerSize",20);
h(2) = plot(NaN,NaN,'.g', "MarkerSize",20);
h(3) = plot(NaN,NaN,'.b', "MarkerSize",20);

title('2020 Trunk Cross Sectional Area')
set(gca,'XTick',[], 'YTick', [])

width = 320;
height = width * 13/7;

set(gcf,'units','points','position',[100,100,width+10,height+25])
set(gca, 'units','points', 'Position', [5,5,width,height])

legend(h, '<30cm^2','30-42cm^2', '>42cm^2');
