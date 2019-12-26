clear;
clc;
%读入图片
fn = imread('鲁ENB911.jpg');
f1=fn;
fn=rgb2gray(fn);
gm = medfilt2(fn); %使用非线性中值滤波的默认参数进行处理
f = tofloat(gm);
g = localthresh(f, ones(3), 8, 0.5, 'global'); %使用局部阈值分割
SIG = stdfilt(f, ones(3));
h = imhist(f);
%利用Ostu进行全局阈值处理
[T, SM] = otsuthresh(h);
g2 = im2bw(gm,T);
%使用连通区域操作删除中间的原点
g = bwareaopen(g2, 80);
%显示效果
figure;
subplot(2,2,1); imshow(f1); title('原始图像');
subplot(2,2,2); imshow(SIG,[]);title('标准差图像');
subplot(2,2,3); imshow(g); title('切割后的图像');