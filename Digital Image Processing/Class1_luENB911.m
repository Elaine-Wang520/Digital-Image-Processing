clear;
clc;
%����ͼƬ
fn = imread('³ENB911.jpg');
f1=fn;
fn=rgb2gray(fn);
gm = medfilt2(fn); %ʹ�÷�������ֵ�˲���Ĭ�ϲ������д���
f = tofloat(gm);
g = localthresh(f, ones(3), 8, 0.5, 'global'); %ʹ�þֲ���ֵ�ָ�
SIG = stdfilt(f, ones(3));
h = imhist(f);
%����Ostu����ȫ����ֵ����
[T, SM] = otsuthresh(h);
g2 = im2bw(gm,T);
%ʹ����ͨ�������ɾ���м��ԭ��
g = bwareaopen(g2, 80);
%��ʾЧ��
figure;
subplot(2,2,1); imshow(f1); title('ԭʼͼ��');
subplot(2,2,2); imshow(SIG,[]);title('��׼��ͼ��');
subplot(2,2,3); imshow(g); title('�и���ͼ��');