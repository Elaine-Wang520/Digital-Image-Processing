function g = imtranslate(f,r,c)
%平移图像。平移后的图像位于画布外的将被裁剪掉，没有被图像占据的画布部分用0填充
%f为原始图像矩阵
%r为行方向平移像素
%c为列方向平移像素
%g为平移后的图像矩阵
se = translate(strel(1),[r, c]);
%strel(1)构造膨胀结构元素，图像不变；[r,c]为平移量
g = imdilate(f,se);%使用膨胀技术对图像进行平移