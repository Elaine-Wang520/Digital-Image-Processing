function g = imtranslate(f,r,c)
%ƽ��ͼ��ƽ�ƺ��ͼ��λ�ڻ�����Ľ����ü�����û�б�ͼ��ռ�ݵĻ���������0���
%fΪԭʼͼ�����
%rΪ�з���ƽ������
%cΪ�з���ƽ������
%gΪƽ�ƺ��ͼ�����
se = translate(strel(1),[r, c]);
%strel(1)�������ͽṹԪ�أ�ͼ�񲻱䣻[r,c]Ϊƽ����
g = imdilate(f,se);%ʹ�����ͼ�����ͼ�����ƽ��