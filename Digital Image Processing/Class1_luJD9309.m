clear;
clc;
%����ͼƬ
f = imread('³JD9309.jpg');
f1 = imread('³JD9309.jpg');
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
%ʹ����ͨ�������ɾ���߿�
g=imclearborder(g);
figure;
subplot(1,2,1); imshow(f1); title('ԭʼͼ��');
subplot(1,2,2); imshow(g); title('ʹ��ȫ����ֵ�ָ�Ľ��');