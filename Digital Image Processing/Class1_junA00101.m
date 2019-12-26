clear;
clc;
%读入图片
f = imread('军A00101.jpg');
f1 = imread('军A00101.jpg');
%使用全局阈值分割的结果
count = 0;%计算迭代次数
T = mean2(f);%灰度均值
done = false;
while ~done
    count = count + 1;
    g = f> T;
    Tnext = 0.5*(mean(f(g))+mean(f(~g)));
    done = abs(T-Tnext)<0.5;
    T = Tnext;
end
g = im2bw(f, T/255);
figure;
subplot(1,2,1); imshow(f1); title('原始图像');
subplot(1,2,2); imshow(g); title('使用全局阈值分割的结果');