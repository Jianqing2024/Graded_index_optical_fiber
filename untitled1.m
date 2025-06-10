clear;clc
load datapgauss.mat
x = linspace(0,20000,size(data,2));
y = linspace(-75,75,size(data,1));


figure(1)
imagesc(x,y,data(:,:,1))

%%
load dataplane.mat
figure(2)
imagesc(x,y,data(:,:,1))