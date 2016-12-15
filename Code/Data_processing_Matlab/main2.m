% selectData=[1,2,3,4,5];
XTrainPrint=zeros(30,64*64);
YTrainPrint=zeros(30,30); 

XTestPrint=zeros(10,64*64);
YTestPrint=zeros(10,30); 

%selectData= zeros(10);
%selectData = randi(3500,1,30)

count=1;
for i=1:30
    for j=1:15
        b=zeros(1,30);
        m = Test2(i,j); 
        m = reshape(m,64*64,1);
        %b = de2bi(i,4);
        b(1,i)=1;
        YTrainPrint(count,:)=b;
        XTrainPrint(count,:)=m;
        count=count+1;
    end 
end

size(XTrainPrint)
size(YTrainPrint)


count=1;
for i=1:30
    for j=1:2
        b=zeros(1,30);
    
        m = Test2(i,j); 
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

fid=fopen('XTrainPrint.txt','a+');
for i=1:450
    for j=1:4096
        fprintf(fid,'%1.0f\t',XTrainPrint(i,j));
    end
  fprintf(fid,'\r\n');
end
fclose(fid);    


fid=fopen('YTrainPrint.txt','a+');
for i=1:450
    for j=1:30
        fprintf(fid,'%1.0f\t',YTrainPrint(i,j));
    end
  fprintf(fid,'\r\n');
end
fclose(fid);


% fid=fopen('XTestPrint.txt','a+');
% for i=1:100
%     for j=1:4096
%         fprintf(fid,'%1.0f\t',XTestPrint(i,j));
%     end
%   fprintf(fid,'\r\n');
% end
% fclose(fid);
% 
% fid=fopen('YTestPrint.txt','a+');
% for i=1:100
%     for j=1:10
%         fprintf(fid,'%1.0f\t',YTestPrint(i,j));
%     end
%   fprintf(fid,'\r\n');
% end
% fclose(fid);