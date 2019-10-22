clear all;
close all;
clc;

X=double(imread('lena.jpg'));
imshow(mat2gray(X));

[i u]=size(X);                                    %����X�Ĺ��
r=100;                                  %���÷ֽ�������
G=rand(i,r);                            %��ʼ��GH��Ϊ�Ǹ���
H=rand(r,u);
maviter=100;                                    %����������

for iter=1:maviter
    G=X*H'*inv(H*H');           %ע�������������ʽ�����е��Ƕ�Ӧ��
    H=H.*sqrt((tem1(G'*X)+tem2(G'*G*H))./(tem1(G'*G)*H+tem2(G'*X)));    
end

img_X=G*H;
figure;
imshow(mat2gray(img_X));

function re=tem1(X)
    [i j]=size(X);
    for iter=1:i
        for iter2=1:j
            X(iter,iter2)=(abs(X(iter,iter2))+X(iter,iter2))/2;
        end
    end
    re=X;
end

function re=tem2(X)
    [i j]=size(X);
    for iter=1:i
        for iter2=1:j
            X(iter,iter2)=(abs(X(iter,iter2))-X(iter,iter2))/2;
        end
    end
   re=X;
end


