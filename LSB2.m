clc
clear all
close all
Picture=imread('test.png'); %����������Ϣ��ͼ��
%��ȡ����
Picture=double(Picture);
[m,n]=size(Picture);
frr=fopen('result.txt','w');%����ȡ��ˮӡд��result.txt

len=120; %�趨������Ϣ����
p=1;
%������ͬ���ӵ�����������ѡȡ���ص�
[row,col]=randinterval(Picture,len,107);
for i=1 :len
    if bitand(Picture(row(i),col(i)),1)==1
        fwrite(frr,1,'ubit1');
        result(p,1)=1;
    else
        fwrite(frr,0,'ubit1');
        result(p,1)=0;
    end
    if p ==len
        break;
    end
    p=p+1;
end
fclose(frr);
f_result=fopen('result.txt')
[msg,msg_len]=fread(f_result,'ubit1=>char');
msg
msg_len