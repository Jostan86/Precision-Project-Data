% In this one dot size is dependant on the yield
clc
clf
clear

T = readtable("All_data.xlsx");

tree_data = table2array(T);
% 
figure(1)
long = tree_data(:, 8);
lat = tree_data(:, 9);
n_2020 = tree_data(:, 4);
% N_2020_rescale = rescale(n_2020, 8, 40);

max_dot_diam = 40;
% Set to 0.5 to do SA, set to 1 to do diameter, or just change as desired
exageration_factor = 1;
% Set to pi to do SA, set to 1 to do diameter, or just change as desired
exageration_factor2 = 1;

scale_factor = 40/(max(n_2020)/exageration_factor2) ^ exageration_factor;
N_2020_rescale = (n_2020./exageration_factor2).^exageration_factor * scale_factor;

for i = 1:length(long)
    if isnan(n_2020(i))
        continue
    end

    if n_2020(i) < 2
        color = 'r';
    elseif n_2020(i) < 2.4
        color = 'g';
    else
        color = 'b';
    end

    plot(long(i), lat(i),'.','MarkerSize', N_2020_rescale(i),'color',color)
    hold on
end
axis([-134.68145  -134.68075 46.2781 46.2794])
pbaspect([7 13 1])
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.r', "MarkerSize",20);
h(2) = plot(NaN,NaN,'.g', "MarkerSize",20);
h(3) = plot(NaN,NaN,'.b', "MarkerSize",20);

% set(gcf,'Position',[100 100 400 800])
legend(h, '< 2% Nitrogen ','2-2.4% Nitrogen', '> 2.4% Nitrogen', fontsize=13);

width = 320;
height = width * 13/7;
title('2020 Nitrogen %', 'FontSize',17)
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'XTick',[], 'YTick', [])


set(gcf,'units','points','position',[100,100,width+10,height+25])
set(gca, 'units','points', 'Position', [5,5,width,height])
