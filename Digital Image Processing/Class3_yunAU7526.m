clear;
clc;
f=imread('云AU7526.jpg');%读入图片
f1=rgb2gray(f);%将图片转为灰度图
figure;
subplot(1,2,1);imshow(f);title('原图');
subplot(1,2,2);imshow(f1);title('灰度图');

%图像边缘提取
f2 = edge(f1,'robert',0.21,'both');
se = [1;1;1]; %线性结构元素
f3 = imerode(f2,se);%腐蚀图像
figure;
subplot(1,2,1);imshow(f2);title('Roberts边缘检测后图像');
subplot(1,2,2);imshow(f3);title('腐蚀后边缘图像');

se = strel('rectangle',[80,80]); %矩形结构元素
f4 = imclose(f3,se);%对图像进行闭运算，填充图像
f5 = bwareaopen(f4,3500);%删除二值图像中面积小于2000的对象
figure;
subplot(1,2,1);imshow(f4);title('填充后图像');
subplot(1,2,2);imshow(f5);title('形态滤波后图像');

[y,x,z] = size(f5);
f6 = double(f5);
%确定车牌的纵向区域
%绘制曲线图
Y1 = zeros(y,1);%zeros功能是返回一个m*n*p*....的double类零矩阵
for i=1:y
    for j=1:x
        if(f6(i,j,1)==1)
            Y1(i,1)=Y1(i,1)+1;%像素点统计
        end
    end
end
figure;
subplot(1,2,1),plot(0:y-1,Y1),title('行方向像素点灰度值累积和'),xlabel('行值'),ylabel('像素');

[temp MaxY] = max(Y1);%Y方向车牌区域确定
PY1 = MaxY;
while((Y1(PY1,1)>=115)&&(PY1>1))
    PY1=PY1-1;
end
PY2 = MaxY;
while((Y1(PY2,1)>=115)&&(PY2<y))
    PY2=PY2+1;
end
IY=f(PY1:PY2,:,:);
%X方向
X1 = zeros(1,x);%进一步确定x方向的车牌区域
for j=1:x
    for i=PY1:PY2
        if (f6(i,j,1)==1)
            X1(1,j)=X1(1,j)+1;
        end
    end
end
subplot(1,2,2),plot(0:x-1,X1),title('列方向像素点灰度值累积和'),xlabel('列值'),ylabel('像素');
PX1=1;
while((X1(1,PX1)<15)&&(PX1<x))
    PX1=PX1+1;
end
PX2=x;
while((X1(1,PX2)<15)&&(PX2>PX1))
    PX2=PX2-1;
end
PX1=PX1+7;%对车牌区域的校正
PX2=PX2-5;
final_img=f(PY1:PY2,PX1:PX2,:);
if isrgb(final_img)
    f1 = rgb2gray(final_img);
else
    f1 = final_img;
end
%进行Ostu全局阈值分割图像
f1 = tofloat(f1);
h = imhist(f1);
[T, SM] = otsuthresh(h);
g2 = im2bw(f1,T);
%使用 bwareaopen进行连通区域操作，删除小面积图像
img = bwareaopen(g2, 300);

SIG1 = stdfilt(f1, ones(3));%标准局部差图像
figure;imshow(SIG1, []);title('标准局部差图像');

figure;
subplot(3,1,1);imshow(f);title('原图');
subplot(3,1,2);imshow(final_img);title('车牌');
subplot(3,1,3);imshow(img);title('切割后的图');

