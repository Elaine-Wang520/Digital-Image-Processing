clear;
clc;
%����ͼ��
f=imread('��K9M555.jpg');
f1=f;
f=rgb2gray(f);%ת��Ϊ�Ҷ�ͼ
f = tofloat(f);
g = localthresh(f, ones(1), 30, 1.05, 'global'); %ʹ�þֲ���ֵ�ָ�
SIG = stdfilt(f, ones(3));%�ֲ���׼��ͼ��
%ʹ�ú���imclearborderɾ���߿�
g=imclearborder(g);
%ʹ�ú���bwareaopenȥ��С���ͼ��
g = bwareaopen(g, 26);
%��ʾЧ��
figure;
subplot(2,2,1); imshow(f1); title('ԭʼͼ��');
subplot(2,2,2); imshow(SIG, []); title('�ֲ���׼��ͼ��');
subplot(2,2,3); imshow(g); title('�и���ͼ��');