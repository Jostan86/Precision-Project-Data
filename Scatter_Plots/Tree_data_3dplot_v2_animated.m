% This one uses rescale instead of my formula to determine the dot size,
% dot size is still dependant on nitrogen percentage
clc
clf
T = readtable("tree_data_2.xlsx");
tree_data = table2array(T);
nitrogen = tree_data(:,3);
nitrogen_mapped = rescale(nitrogen, 8, 40);
for i = 1:length(tree_data)
    if tree_data(i,3) < 2
        color = 'r';
    elseif tree_data(i,3) < 2.4
        color = 'g';
    else
        color = 'b';
    end
    plot3(tree_data(i,6),tree_data(i,5),tree_data(i,2),'.','MarkerSize',nitrogen_mapped(i), 'color',color)
    hold on
end

zlabel("Trunk CS-Area (cm^2)");
ylabel("Canopy Density");
xlabel("Canopy Volume (m^3)");
grid on
axis([16 32 .45 .85 20 60]);
% h = zeros(3, 1);
% h(1) = plot(NaN,NaN,'.r', "MarkerSize",20);
% h(2) = plot(NaN,NaN,'.b', "MarkerSize",20);
% h(3) = plot(NaN,NaN,'.g', "MarkerSize",20);
% 
% 
% legend(h, '<2% Nitrogen ','2-2.4% Nitrogen', '>2.4% Nitrogen');
az = 45;
el = 45;

% az = 0;
% el = 90;
view([az,el])
degStep = 0.25;
detlaT = 0.05;
fCount = 40;
f = getframe(gcf);
[im,map] = rgb2ind(f.cdata,256,'nodither');
% im(1,1,1,fCount) = 0;
k = 1;
for i = 0:1:15
  f = getframe(gcf);
  im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
  k = k + 1;
end
% spin 45°
for i = 45:-degStep:15
  az = i;
  view([az,el])
  f = getframe(gcf);
  im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
  k = k + 1;
end
for i = 0:1:15
  f = getframe(gcf);
  im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
  k = k + 1;
end
for i = 15:degStep:75
  az = i;
  view([az,el])
  f = getframe(gcf);
  im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
  k = k + 1;
end
for i = 0:1:15
  f = getframe(gcf);
  im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
  k = k + 1;
end
for i = 75:-degStep:45
  az = i;
  view([az,el])
  f = getframe(gcf);
  im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
  k = k + 1;
end

% tilt down
% for i = 90:-degStep:15
%   el = i;
%   view([az,el])
%   f = getframe(gcf);
%   im(:,:,1,k) = rgb2ind(f.cdata,map,'nodither');
%   k = k + 1;
% end

imwrite(im,map,'Animation5.gif','DelayTime',detlaT,'LoopCount',inf)


