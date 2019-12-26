clear;
clc;
f=imread('��AU7526.jpg');%����ͼƬ
f1=rgb2gray(f);%��ͼƬתΪ�Ҷ�ͼ
figure;
subplot(1,2,1);imshow(f);title('ԭͼ');
subplot(1,2,2);imshow(f1);title('�Ҷ�ͼ');

%ͼ���Ե��ȡ
f2 = edge(f1,'robert',0.21,'both');
se = [1;1;1]; %���ԽṹԪ��
f3 = imerode(f2,se);%��ʴͼ��
figure;
subplot(1,2,1);imshow(f2);title('Roberts��Ե����ͼ��');
subplot(1,2,2);imshow(f3);title('��ʴ���Եͼ��');

se = strel('rectangle',[80,80]); %���νṹԪ��
f4 = imclose(f3,se);%��ͼ����б����㣬���ͼ��
f5 = bwareaopen(f4,3500);%ɾ����ֵͼ�������С��2000�Ķ���
figure;
subplot(1,2,1);imshow(f4);title('����ͼ��');
subplot(1,2,2);imshow(f5);title('��̬�˲���ͼ��');

[y,x,z] = size(f5);
f6 = double(f5);
%ȷ�����Ƶ���������
%��������ͼ
Y1 = zeros(y,1);%zeros�����Ƿ���һ��m*n*p*....��double�������
for i=1:y
    for j=1:x
        if(f6(i,j,1)==1)
            Y1(i,1)=Y1(i,1)+1;%���ص�ͳ��
        end
    end
end
figure;
subplot(1,2,1),plot(0:y-1,Y1),title('�з������ص�Ҷ�ֵ�ۻ���'),xlabel('��ֵ'),ylabel('����');

[temp MaxY] = max(Y1);%Y����������ȷ��
PY1 = MaxY;
while((Y1(PY1,1)>=115)&&(PY1>1))
    PY1=PY1-1;
end
PY2 = MaxY;
while((Y1(PY2,1)>=115)&&(PY2<y))
    PY2=PY2+1;
end
IY=f(PY1:PY2,:,:);
%X����
X1 = zeros(1,x);%��һ��ȷ��x����ĳ�������
for j=1:x
    for i=PY1:PY2
        if (f6(i,j,1)==1)
            X1(1,j)=X1(1,j)+1;
        end
    end
end
subplot(1,2,2),plot(0:x-1,X1),title('�з������ص�Ҷ�ֵ�ۻ���'),xlabel('��ֵ'),ylabel('����');
PX1=1;
while((X1(1,PX1)<15)&&(PX1<x))
    PX1=PX1+1;
end
PX2=x;
while((X1(1,PX2)<15)&&(PX2>PX1))
    PX2=PX2-1;
end
PX1=PX1+7;%�Գ��������У��
PX2=PX2-5;
final_img=f(PY1:PY2,PX1:PX2,:);
if isrgb(final_img)
    f1 = rgb2gray(final_img);
else
    f1 = final_img;
end
%����Ostuȫ����ֵ�ָ�ͼ��
f1 = tofloat(f1);
h = imhist(f1);
[T, SM] = otsuthresh(h);
g2 = im2bw(f1,T);
%ʹ�� bwareaopen������ͨ���������ɾ��С���ͼ��
img = bwareaopen(g2, 300);

SIG1 = stdfilt(f1, ones(3));%��׼�ֲ���ͼ��
figure;imshow(SIG1, []);title('��׼�ֲ���ͼ��');

figure;
subplot(3,1,1);imshow(f);title('ԭͼ');
subplot(3,1,2);imshow(final_img);title('����');
subplot(3,1,3);imshow(img);title('�и���ͼ');

