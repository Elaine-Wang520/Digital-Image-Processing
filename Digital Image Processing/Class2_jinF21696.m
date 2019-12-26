clear;
clc;
f = imread('晋F21696.jpg');
%转换为灰度图
f1 = rgb2gray(f);
gm = tofloat(f1);
%直接显示图像的灰度直方图
h = imhist(gm);
%利用Ostu进行全局阈值处理
[T, SM] = otsuthresh(h);
g2 = im2bw(gm,T);

figure;
subplot(2,2,1);imshow(f);title('原图');
subplot(2,2,2);imshow(g2);title('分割后的图像');