close all;
clear;
clc;

load feature_space.mat;

% tic; 
[seg,phi] = chenvese(maskF,'whole',500,0.01,'chan',2,10); 
% toc;

figure; surf(phi(:,:,1)); shading interp;