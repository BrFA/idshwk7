clc
clear all
close all

Picture=imread('t1.png'); %读入载体图像
Double_Picture=double(Picture);%将图像转化为二进制格式
id=fopen('t1.txt','r');
[msg,msg_len]=fread(id,'ubit1');%读取二进制文件的数据，并将数据存入矩阵。

[m,n]=size(Picture);
if msg_len>m*n
  error('嵌入信息量过大');
end

%p作为消息嵌入计数器
p=1;
%调用随机间隔函数选取像素点
[row,col]=randinterval(Double_Picture,msg_len,107);
%在最低位隐藏信息
for i=1:msg_len
    Double_Picture(row(i),col(i))=Double_Picture(row(i),col(i))-mod(Double_Picture(row(i),col(i)),2)+msg(p,1);
    if p==msg_len
        break;
    end
    p=p+1;
end

Double_Picture=uint8(Double_Picture);
imwrite(Double_Picture,'test.png'); %生成秘密信息
subplot(121);imshow(Picture);title(' 原始图片');
subplot(122);imshow(Double_Picture);title(' 嵌入水印的图片');


