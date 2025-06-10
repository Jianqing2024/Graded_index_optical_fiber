clear;clc
fid = fopen("new2.txt", 'r');
num_header_lines = 3;
headers = cell(num_header_lines, 1);
for i = 1:num_header_lines
    headers{i} = fgetl(fid);
end
fclose(fid);

data1D = readmatrix("new.txt");

dataX = str2num(headers{1});
dataY = str2num(headers{2});
dataZ = str2num(headers{3});

X = linspace(dataX(2), dataX(3), dataX(1));
Y = linspace(dataY(2), dataY(3), dataY(1));
Z = linspace(dataZ(2), dataZ(3), dataZ(1));

data3D = reshape(data1D, [dataX(1), dataY(1), dataZ(1)]);

%%
% 提取二维数据
data2D = data3D(:, :, 1);

f1 = figure(1);
imagesc(Y, X, data2D)
axis equal