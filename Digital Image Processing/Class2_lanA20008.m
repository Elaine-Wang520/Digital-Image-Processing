clear;
clc;
%����ͼƬ
f = imread('��A20008.jpg');
%ת��Ϊ�Ҷ�ͼ
f1 = rgb2gray(f);
%ʹ����ֵ�˲���Ĭ�ϲ������д���
gm = medfilt2(f1); 
gm = tofloat(gm);
%ֱ����ʾͼ��ĻҶ�ֱ��ͼ
h = imhist(gm);
%����Ostu����ȫ����ֵ����
[T, SM] = otsuthresh(h);
g2 = im2bw(gm,T);
g=imclearborder(g2);
figure;
subplot(2,2,1);imshow(f);title('ԭͼ');
subplot(2,2,2);imshow(g);title('�ָ���ͼ��');