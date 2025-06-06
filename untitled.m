clear;clc
r = 61.2;
N = 10000;
nco = 1.4674;
ncl = 1.4607;
x = linspace(-r, r, N);
y = linspace(-r, r, N);
a = 4.1;
A = 15;

n = zeros(N, N);
for i=1:N
    for j=1:N
        r2 = x(i)^2+y(j)^2;
        if sqrt(r2) < A
            n(i,j) = sqrt(ncl^2 + (a/A)^2*(nco^2-ncl^2)*exp(-(r2/A^2)));
        else
            n(i,j) = ncl;
        end
    end
end

figure(1)
imagesc(x,y,n)
axis equal