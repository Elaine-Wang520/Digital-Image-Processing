clear;
clc;
%读入图像
f=imread('鄂K9M555.jpg');
f1=f;
f=rgb2gray(f);%转换为灰度图
f = tofloat(f);
g = localthresh(f, ones(1), 30, 1.05, 'global'); %使用局部阈值分割
SIG = stdfilt(f, ones(3));%局部标准差图像
%使用函数imclearborder删除边框
g=imclearborder(g);
%使用函数bwareaopen去除小面积图像
g = bwareaopen(g, 26);
%显示效果
figure;
subplot(2,2,1); imshow(f1); title('原始图像');
subplot(2,2,2); imshow(SIG, []); title('局部标准差图像');
subplot(2,2,3); imshow(g); title('切割后的图像');