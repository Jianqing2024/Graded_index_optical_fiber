clear;clc
r = 1.8e-3;
N = 100000;
R = linspace(-r, r, N);
l1 = 0.532e-6;
l2 = 0.8e-6;
f = 32e-3;

lambda0 = -(2*pi/l1)*(sqrt(R.^2+f^2)-f);
lambda1 = -(2*pi/l2)*(sqrt(R.^2+f^2)-f);

figure(1)
plot(R, lambda1, R, lambda0)
legend('800', '532') 

phase = [1.68681,2.28286,2.03638,3.9275,4.87649];

lambda = linspace(0.6, 0.5, 5);

figure(2)
plot(lambda, phase, lambda, wrapToPi(phase))
legend('NONE-Wrap', 'Wrap') 
%%

dbfile = 'Main.db';
conn = sqlite(dbfile, 'readonly');

% 2. 执行 SQL 查询，提取 angleIn1 和 angleIn5 字段
data = fetch(conn, 'SELECT angleIn1, angleIn5 FROM Parameter');

x = double(data.angleIn1);  % 横坐标
y = double(data.angleIn5);  % 纵坐标

% 4. 绘制散点图
figure(3);
scatter(x, y, 30, 'filled');  % 30 是点的大小，可根据需要调整
xlabel('angleIn0.6');
ylabel('angleIn0.5');
title('Angle In 0.6 vs 0.5');
grid on;

% 5. 关闭数据库连接
close(conn);

% 4. 可选：关闭数据库连接
close(conn);

