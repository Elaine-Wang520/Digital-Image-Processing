clear;
clc;
%����ͼƬ
I = imread('��A16777.jpg');
I1=imread('��A16777.jpg');
%��ͼƬת��Ϊ�Ҷ�ͼ
I=rgb2gray(I);
%��������
I=medfilt2(I);
%ͼƬ����
temp = I;
I = double(I);
w1 = [-1 0; 0 1];
w2 = [0 -1;1 0];
%ʹ��replicateѡ���߽�
G1 = imfilter(I,w1,'corr','replicate');
G2 = imfilter(I,w2,'corr','replicate');
G = abs(G1)+abs(G2);
                             
%�񻯺����ǿͼ��
w3 = [1 4 1;4 -80 4;1 4 1];
%ʹ��replicateѡ���߽�
L = imfilter(I,w3,'corr','replicate');
g = localthresh(I, ones(1), 31, 0.81, 'global'); %ʹ�þֲ���ֵ�ָ�
SIG = stdfilt(L, ones(3));

figure;
subplot(3,1,1);imshow(I1),title('ԭͼ��');
subplot(3,1,2);imshow(SIG, []);title('�ֲ���׼��ͼ��');
subplot(3,1,3);imshow(g);title('�и���ͼ��');
