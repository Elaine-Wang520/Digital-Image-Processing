clear;
clc;
%读入图片
I = imread('蒙A16777.jpg');
I1=imread('蒙A16777.jpg');
%将图片转换为灰度图
I=rgb2gray(I);
%消除噪声
I=medfilt2(I);
%图片的锐化
temp = I;
I = double(I);
w1 = [-1 0; 0 1];
w2 = [0 -1;1 0];
%使用replicate选项处理边界
G1 = imfilter(I,w1,'corr','replicate');
G2 = imfilter(I,w2,'corr','replicate');
G = abs(G1)+abs(G2);
                             
%锐化后的增强图像
w3 = [1 4 1;4 -80 4;1 4 1];
%使用replicate选项处理边界
L = imfilter(I,w3,'corr','replicate');
g = localthresh(I, ones(1), 31, 0.81, 'global'); %使用局部阈值分割
SIG = stdfilt(L, ones(3));

figure;
subplot(3,1,1);imshow(I1),title('原图像');
subplot(3,1,2);imshow(SIG, []);title('局部标准差图像');
subplot(3,1,3);imshow(g);title('切割后的图像');
