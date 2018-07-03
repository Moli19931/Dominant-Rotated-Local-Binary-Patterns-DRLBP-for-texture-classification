%Precision _Recall _ for _images
load('C:\Users\JAI\Desktop\c.mat');
matrix70=zeros(2800,5);
% 4th and 5th col for precision and recall 
path='E:\molu\database\';
m=1;
for folder_number=1:112
    for image_num=1:25
        matrix70(m,1)=folder_number;
        matrix70(m,2)=image_num;
        m=m+1;
    end
end
for i=1:2800
    category_number=c{i,1};
    Fq=c{i,3};
    %This loop is to calculate dissimailarity measure for images before the
    %query image
    if i~=1
        n=i-1;
        for g=1:n
        Fdb=c{g,3};
        k1=0;
        for i1=1:768
            temp=abs(Fdb(i1)-Fq(i1));
            temp1=temp/(1+Fq(i1)+Fdb(i1));
            k1=k1+temp1;
        end
        %saving the Fdb value in the matrix's 3rd column
        matrix70(g,3)=k1;
    end
    end
    
    %This loop is to calculate dissimailarity measure for images after the
    %query image
    if i~=2800
     m=i+1;
      for j=m:2800 
        Fdb=c{j,3};
        k1=0;
        for i1=1:768
            temp=abs(Fdb(i1)-Fq(i1));
            temp1=temp/(1+Fq(i1)+Fdb(i1));
            k1=k1+temp1;
        end
        %saving the Fdb value in the matrix's 3rd column
        matrix70(j,3)=k1;       
    end
    end
   
    % now sort the matrix on the basis of dissimilarity
    m1=sortrows(matrix70,3);
    % retrieving the top 10
    relevant_retrieved=0;
    for j1=1:70
        if m1(j1,1)==category_number;
            relevant_retrieved=relevant_retrieved+1;
            
        end
    end
    Precision=relevant_retrieved/70;
    Recall=relevant_retrieved/25;
    matrix70(i,4)=Precision;
    matrix70(i,5)=Recall;    
end
%final output is matrix

