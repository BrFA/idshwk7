clc
clear all
close all

Picture=imread('t1.png'); %��������ͼ��
Double_Picture=double(Picture);%��ͼ��ת��Ϊ�����Ƹ�ʽ
id=fopen('t1.txt','r');
[msg,msg_len]=fread(id,'ubit1');%��ȡ�������ļ������ݣ��������ݴ������

[m,n]=size(Picture);
if msg_len>m*n
  error('Ƕ����Ϣ������');
end

%p��Ϊ��ϢǶ�������
p=1;
%��������������ѡȡ���ص�
[row,col]=randinterval(Double_Picture,msg_len,107);
%�����λ������Ϣ
for i=1:msg_len
    Double_Picture(row(i),col(i))=Double_Picture(row(i),col(i))-mod(Double_Picture(row(i),col(i)),2)+msg(p,1);
    if p==msg_len
        break;
    end
    p=p+1;
end

Double_Picture=uint8(Double_Picture);
imwrite(Double_Picture,'test.png'); %����������Ϣ
subplot(121);imshow(Picture);title(' ԭʼͼƬ');
subplot(122);imshow(Double_Picture);title(' Ƕ��ˮӡ��ͼƬ');


