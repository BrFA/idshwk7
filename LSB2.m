clc
clear all
close all
Picture=imread('test.png'); %读入隐秘信息的图像
%提取过程
Picture=double(Picture);
[m,n]=size(Picture);
frr=fopen('result.txt','w');%将提取的水印写入result.txt

len=120; %设定隐藏信息长度
p=1;
%调用相同种子的随机间隔函数选取像素点
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