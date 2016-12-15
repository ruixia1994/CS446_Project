function out =Test2(n,j)
% nth character? jth type
str1 = num2str(j);
str2 =num2str(n);
str=['./Printed characters/type',str1,'/',str2,'.png']; 

%file = fopen(str,'r');
out = imread(str);
out=rgb2gray(out);
out = im2bw(out);
out = ReSize(out);
% out = imresize(out,[64,64]);
% out = 1-out;
out=smoth(out);
out=bwmorph(out,'thin',inf);

end
% out=smoth(out);
% imshow(out)
% out=bwmorph(out,'thin',inf);
% imshow(out)