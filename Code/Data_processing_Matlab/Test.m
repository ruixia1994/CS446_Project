function out =Test(n,fileNum)
str1 = num2str(fileNum,'%.3d');
str=['dataset_604469/604469/hh',str1,'.hcl']; 

file = fopen(str,'r');
fread(file,512*n,'int8');
m = [];
for i=1:64
    ss = [];
    for j=1:8
        ss = [ss,fliplr(fread(file,8,'ubit1')')];
    end
    m=[m;ss];
end

m = smoth(m);
m = bwmorph(m,'thin',inf);
% m = Checkcurve(m);
% [a,b] = extract(m);
%showFea(a,b);
b = fclose(file);
out = m;
end

