% selectData=[1,2,3,4,5];
XTrain=zeros(30,64*64);
YTrain=zeros(30,30); 

XTest=zeros(10,64*64);
YTest=zeros(10,30); 

%selectData= zeros(10);
selectData = randi(500,1,30);


%selectData=[1,2,3,4,5,6,7,8,9,10];

count=1;
for i=1:30
    for j=1:500
        b=zeros(1,30);
        n = selectData(i);
        m = Test(i,j); 
        m = reshape(m,64*64,1);
        %b = de2bi(i,4);
        b(1,i)=1;
        YTrain(count,:)=b;
        XTrain(count,:)=m;
        count=count+1;
    end 
end

size(XTrain)
size(YTrain)


count=1;
for i=1:30
    for j=501:700
        b=zeros(1,30);
        n = selectData(i);
        m = Test(i,j); 
        m = reshape(m,64*64,1);
        %b = de2bi(i,4);
        b(1,i)=1;
        YTest(count,:)=b;
        XTest(count,:)=m;
        count=count+1;
    end 
end
size(XTest)
size(YTest)

fid=fopen('XTrain.txt','a+');
for i=1:1000
    for j=1:4096
        fprintf(fid,'%1.0f\t',XTrain(i,j));
    end
  fprintf(fid,'\r\n');
end
fclose(fid);


fid=fopen('YTrain.txt','a+');
for i=1:1000
    for j=1:10
        fprintf(fid,'%1.0f\t',YTrain(i,j));
    end
  fprintf(fid,'\r\n');
end
fclose(fid);


fid=fopen('XTest.txt','a+');
for i=1:100
    for j=1:4096
        fprintf(fid,'%1.0f\t',XTest(i,j));
    end
  fprintf(fid,'\r\n');
end
fclose(fid);

fid=fopen('YTest.txt','a+');
for i=1:100
    for j=1:10
        fprintf(fid,'%1.0f\t',YTest(i,j));
    end
  fprintf(fid,'\r\n');
end
fclose(fid);





