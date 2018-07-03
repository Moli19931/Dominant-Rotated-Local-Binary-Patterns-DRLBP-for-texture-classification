load('matrix55.mat');
precision_of_images=zeros(2800,1);
recall_of_images=zeros(2800,1);
for i=1:2800
    precision_of_images(i,1)=matrix55(i,4);
end
for i=1:2800
    recall_of_images(i,1)=matrix55(i,5);
end
n = 25; % average every n values
%a = reshape(cumsum(ones(n,10),2),[],1); % arbitrary data
%precision recall for each category of image
p = arrayfun(@(i) mean(precision_of_images(i:i+n-1)),1:n:length(precision_of_images)-n+1)'; % the averaged vector
r = arrayfun(@(i) mean(recall_of_images(i:i+n-1)),1:n:length(recall_of_images)-n+1)'; % the averaged vector
%precision recall for whole database
precision=mean(p);
recall=mean(r);
display(precision);
display(recall);