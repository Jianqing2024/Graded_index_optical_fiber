clear;clc
% load('data.mat');
% x = linspace(0,2000,size(data,2));
% y = linspace(-75,75,size(data,1));
% figure(1)
% imagesc(x,y,data(:,:,1))
% 
% in = trapz(y,data(:,int16(mode(size(data,2)*0.0002))));
% out = trapz(y,data(:,18000));
% trans = out/in;
%save datapgauss.mat data in out trans

load('dataa.mat');
load('datab.mat');
load('datac.mat');
x = linspace(0,3000,size(dataa,2));
y = linspace(-75,75,size(dataa,1));

yy = linspace(-75,75,numel(datab));

Ny = int16(numel(yy)*125/150);
yyy = linspace(-62.5,62.5,Ny);
in = trapz(yy,datac);
diff = (numel(yy)-numel(yyy))/2;
mid = numel(yy)/2;
out = trapz(yyy,datab(int16(1 +  diff) : int16(numel(yy) - diff)));
trans = out/in;

figure(1)
imagesc(x,y,dataa(:,:,1))
title(trans)