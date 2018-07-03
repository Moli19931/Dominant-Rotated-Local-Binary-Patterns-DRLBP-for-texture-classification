%r=1,P=8 (number of neighbors)
img=imread('063.png');
grayImage=double(rgb2gray(img));
[x,y]=size(grayImage);
output=zeros(x,y);
P=8;
for i=2:x-1
    for j=2:y-1
        IC=grayImage(i,j);
        I0=grayImage(i,j+1);
        I1=grayImage(i+1,j+1);
        I2=grayImage(i+1,j);
        I3=grayImage(i+1,j-1);
        I4=grayImage(i,j-1);
        I5=grayImage(i-1,j-1);
        I6=grayImage(i-1,j);
        I7=grayImage(i-1,j+1);
        g=[I0,I1,I2,I3,I4,I5,I6,I7];
        [D,I]=max([abs(IC-I0),abs(IC-I1),abs(IC-I2),abs(IC-I3),abs(IC-I4),abs(IC-I5),abs(IC-I6),abs(IC-I7)]);
        temp=0;
        for k=1:P
            gp=g(k);
            sf=SfUNCTION(gp,IC);
            power1=mod(k-I,P);
            temp=temp+sf*power(2,power1);
        end
        output(i,j)=temp;
       
    end
end
imshow(mat2gray(output));
