clear;clc
n1 = 1.4663;
n2 = 1.4526;
ncl = 1.4674;
nol = 1.4607;
R_max = 62.5;

Nx = 400;
Ny = 10000;
Nz = 2;

ymid=100;
ymax=387;

delta=(n1^2-n2^2)/(2*n1^2);
a=4.1;
b=25;

% 坐标轴
x = linspace(-R_max, R_max, Nx);
y = linspace(0, ymax, Ny);
z = linspace(-100, 100, Nz);

fid = fopen('new2.txt', 'w');

fprintf(fid, '%i %d %d\n', [Nx,-R_max,R_max]);
fprintf(fid, '%i %d %d\n', [Ny,0,ymax]);
fprintf(fid, '%i %d %d\n', [Nz,0,1]);

for i = 1:Nz
    for j = 1:Ny
        Y = y(j);

        if Y < ymid
            Rmax = a;
            for k = 1:Nx
                X = abs(x(k));
                if X <= Rmax
                    n = ncl;
                else
                    n = nol;
                end
                fprintf(fid, '%.8f\n', n);
            end

        else
            Rmax = b;
            for k = 1:Nx
                X = abs(x(k));
                if X <= Rmax
                    n = n1*sqrt(1-2*delta*(X/b)^2);
                else
                    n = n2;
                end
                fprintf(fid, '%.8f\n', n);
            end
        end
    end
end

fclose(fid);