clear;
clc;
%读入图片
f = imread('兰A20008.jpg');
%转换为灰度图
f1 = rgb2gray(f);
%使用中值滤波的默认参数进行处理
gm = medfilt2(f1); 
gm = tofloat(gm);
%直接显示图像的灰度直方图
h = imhist(gm);
%利用Ostu进行全局阈值处理
[T, SM] = otsuthresh(h);
g2 = im2bw(gm,T);
g=imclearborder(g2);
figure;
subplot(2,2,1);imshow(f);title('原图');
subplot(2,2,2);imshow(g);title('分割后的图像');
