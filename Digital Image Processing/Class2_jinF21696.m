clear;
clc;
f = imread('��F21696.jpg');
%ת��Ϊ�Ҷ�ͼ
f1 = rgb2gray(f);
gm = tofloat(f1);
%ֱ����ʾͼ��ĻҶ�ֱ��ͼ
h = imhist(gm);
%����Ostu����ȫ����ֵ����
[T, SM] = otsuthresh(h);
g2 = im2bw(gm,T);

figure;
subplot(2,2,1);imshow(f);title('ԭͼ');
subplot(2,2,2);imshow(g2);title('�ָ���ͼ��');