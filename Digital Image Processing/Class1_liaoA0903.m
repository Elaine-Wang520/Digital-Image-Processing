clear;
clc;
%����ͼƬ
f = imread('��A09030.jpg');
f1 = imread('��A09030.jpg');
%ʹ��ȫ����ֵ�ָ�Ľ��
count = 0;%�����������
T = mean2(f);%�ҶȾ�ֵ
done = false;
while ~done
    count = count + 1;
    g = f> T;
    Tnext = 0.5*(mean(f(g))+mean(f(~g)));
    done = abs(T-Tnext)<0.5;
    T = Tnext;
end
g = im2bw(f, T/255);
%ʹ��imclearborder�����Ա߽������
g=imclearborder(g);
%ʹ����ͨ�������ɾ���м��ԭ��
g = bwareaopen(g, 14);
figure;
subplot(2,2,1); imshow(f1); title('ԭʼͼ��');
subplot(2,2,2); imshow(g); title('ʹ��ȫ����ֵ�ָ�Ľ��');