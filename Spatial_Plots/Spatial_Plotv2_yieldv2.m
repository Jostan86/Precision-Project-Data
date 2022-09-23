% In this one dot size is dependant on the yield
clc
clf
clear

T = readtable("All_data.xlsx");

tree_data = table2array(T);
% 

long = tree_data(:, 8);
lat = tree_data(:, 9);
yield = tree_data(:, 7);
surf(long,lat,yield)
% yield_rescale = rescale(yield, 8, 40);
% for i = 1:length(long)
%     if isnan(yield(i))
%         continue
%     end
% 
%     if yield(i) < 10000
%         color = 'r';
%     elseif yield(i) < 30000
%         color = 'g';
%     else
%         color = 'b';
%     end
% 
%     plot(long(i), lat(i),'.','MarkerSize', yield_rescale(i),'color',color)
%     hold on
% end
% fprintf("%.8f\n", max(lat));
% fprintf("%.8f\n", min(lat));
% axis([-134.68145  -134.68075 46.2781 46.2794])
% pbaspect([7 13 1])

