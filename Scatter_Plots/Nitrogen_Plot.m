% In this one dot size is dependant on the yield
clc
clf
clear

T = readtable("tree_data_2.xlsx");

tree_data = table2array(T);

N_21 = tree_data(:,3);
N_20 = tree_data(:,4);

for i = 1:length(N_21)
%     plot(i,N_20(i), "Marker",".","Color",'g', "MarkerSize",8)
    hold on
%     plot(i,N_21(i), "Marker",".", "Color",'b', "MarkerSize",8)
    if N_21(i) > N_20(i)
        plot([i, i],[N_20(i), N_21(i)], "Color",'#40D11C',"LineWidth",2)
  
    else 
        plot([i, i],[N_20(i), N_21(i)], "Color",'b',"LineWidth",2)
    end
end
xlabel("tree")
grid on

ylabel("Nitrogen 2021%")
h = zeros(2, 1);
h(1) = plot(NaN,NaN,'-g');
h(2) = plot(NaN,NaN,'-b');
title("Nitrogen Change 2020-2021")
legend(h, 'N increased', 'N decreased');

n_change_abs = mean(abs(N_21-N_20));
n_change_total = mean(N_21-N_20);
str=sprintf("Average Absolute Change = %1.2f%%\nAverage Total Change = +%1.2f%%",n_change_abs, n_change_total);
text_x = (0.15 * (max(get(gca, 'xlim')) - min(get(gca, 'xlim')))) + min(get(gca, 'xlim'));
text_y = (0.31 * (max(get(gca, 'ylim')) - min(get(gca, 'ylim')))) + min(get(gca, 'ylim'));

T = text(text_x, text_y, str); 
set(T, 'fontsize', 12, 'verticalalignment', 'top', 'horizontalalignment', 'left');
