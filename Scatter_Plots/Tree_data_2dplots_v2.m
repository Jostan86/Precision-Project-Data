% In this one dot size is dependant on the yield
clc
clf
clear

T = readtable("tree_data_2.xlsx");

tree_data = table2array(T);
% 
x_col = 4;
y_col = 3;
y_data = tree_data(:, y_col);
x_data = tree_data(:, 6)./tree_data(:, 8);
plot(x_data, y_data,'b.', 'MarkerSize', 15)
% xlabel("Density")
xlabel("Canopy Volume/Diameter (m^3/cm)")


% Get coefficients of a line fit through the data.
coefficients = polyfit(x_data, y_data, 2);
% Create a new x axis with exactly 1000 points (or whatever you want).
xFit = linspace(min(x_data), max(x_data), 1000);
% Get the estimated yFit value for each of those 1000 new x locations.
yFit = polyval(coefficients , xFit);
% Plot everything.
% plot(x, y, 'b.', 'MarkerSize', 15); % Plot training data.
hold on; % Set hold on so the next plot does not blow away the one we just drew.
% plot(xFit, yFit, 'r-', 'LineWidth', 2); % Plot fitted line.
grid on;

% Get coefficients of a line fit through the data.
coefficients = polyfit(x_data, y_data, 1);
% Create a new x axis with exactly 1000 points (or whatever you want).
xFit = linspace(min(x_data), max(x_data), 1000);
% Get the estimated yFit value for each of those 1000 new x locations.
yFit = polyval(coefficients , xFit);
% Plot everything.


plot(xFit, yFit, 'b-', 'LineWidth', 2); % Plot fitted line.


% if x_col == 5
%     xlabel('Density')
% elseif x_col == 2
%     xlabel('TCSA (cm^2)')
% elseif x_col == 3
%     xlabel('Leaf Nitrogen %')
% elseif x_col == 4
%     xlabel('Nitrogen 2020 %')
% elseif x_col == 6
%     xlabel('Volume (m^3)')
% elseif x_col == 7
%     xlabel('Yield (g)')
% elseif x_col == 8
%     xlabel('Diameter (cm)')
% end

if y_col == 5
    ylabel('Density')
elseif y_col == 2
    ylabel('TCSA (cm^2)')
elseif y_col == 3
    ylabel('2021 Nitrogen %')
elseif y_col == 4
    ylabel('Nitrogen 2020 %')
elseif y_col == 6
    ylabel('Volume (m^3)')
elseif y_col == 7
    ylabel('Yield (g)')
elseif y_col == 8
    ylabel('Diameter (cm)')
end
mdl = fitlm(x_data, y_data);

tmp=corrcoef(x_data,y_data);
str=sprintf('r^2 = %1.2f',tmp(1,2)^2);
text_x = (0.89 * (max(get(gca, 'xlim')) - min(get(gca, 'xlim')))) + min(get(gca, 'xlim'));
text_y = (0.67 * (max(get(gca, 'ylim')) - min(get(gca, 'ylim')))) + min(get(gca, 'ylim'));

T = text(text_x, text_y, str); 
set(T, 'fontsize', 12, 'verticalalignment', 'top', 'horizontalalignment', 'left');
