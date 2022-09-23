% In this one dot size is dependant on the yield
clc
clf
clear

T = readtable("All_data.xlsx");

tree_data = table2array(T);
% 

long = tree_data(:, 8);
lat = tree_data(:, 9);
n_2021A = tree_data(:, 10);
N_2021A_rescale = rescale(n_2021A, 8, 40);
for i = 1:length(long)
    if isnan(n_2021A(i))
        continue
    end

    if n_2021A(i) < 2
        color = 'r';
    elseif n_2021A(i) < 2.4
        color = 'g';
    else
        color = 'b';
    end

    plot(long(i), lat(i),'.','MarkerSize', N_2021A_rescale(i),'color',color)
    hold on
end
axis([-134.68145  -134.68075 46.2781 46.2794])
pbaspect([7 13 1])
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.r', "MarkerSize",20);
h(2) = plot(NaN,NaN,'.g', "MarkerSize",20);
h(3) = plot(NaN,NaN,'.b', "MarkerSize",20);
title('Spatial Plot of 2021 Leaf Nitrogen % for A trees')

legend(h, '<2% Nitrogen ','2-2.4% Nitrogen', '>2.4% Nitrogen');