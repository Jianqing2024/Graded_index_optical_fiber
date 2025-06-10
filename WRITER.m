clear;clc
% 设定参数
nco = 1.4674;
ncl = 1.4607;
R_max = 62.5;

Nx = 200;
Ny = 40000;
Nz = 2;

ymid=250;
ymax=1000;

delta=(nco^2-ncl^2)/(2*nco^2);
a=4.1;
b=15;
alphia=(b-a)/ymid;

% 坐标轴
x = linspace(-R_max, R_max, Nx);
y = linspace(0, ymax, Ny);
z = linspace(-100, 100, Nz);

fid = fopen('new.txt', 'w');

fprintf(fid, '%i %d %d\n', [Nx,-R_max,R_max]);
fprintf(fid, '%i %d %d\n', [Ny,0,ymax]);
fprintf(fid, '%i %d %d\n', [Nz,0,1]);

for i = 1:Nz
    for j = 1:Ny
        Y = y(j);

        if Y < ymid
            shift = (a + alphia * Y)^4;
            Rmax = a+alphia*Y;
            for k = 1:Nx
                X = x(k);
                n = StageConical(nco, ncl, a, delta, Rmax, X, shift);
                fprintf(fid, '%.8f\n', n);
            end

        else
            shift = (a+alphia*ymid)^4;
            Rmax = b;
            for k = 1:Nx
                X = x(k);
                n = StageConical(nco, ncl, a, delta, Rmax, X, shift);
                fprintf(fid, '%.8f\n', n);
            end
        end
    end
end

fclose(fid);


function n = StageConical(nco, ncl, a, delta, R_max, x, ShiftForConical)
r = abs(x);

if r >= R_max
    n = ncl;
else
    n = single(sqrt(nco^2*(1-2*delta*(a^2*r^2)/ShiftForConical)));
end

end