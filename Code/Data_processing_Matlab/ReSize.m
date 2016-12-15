function out = ReSize(in)
in = ~in;
[x,y] = size(in);
up = 0;
down = 0;
left = 0;
right = 0;
for i=1:x
    if sum(in(i,:))==0
        up = up+1;
    else
        break;
    end
end
for i=1:y
    if sum(in(:,i))==0
        left = left+1;
    else
        break;
    end
end
for i=x:-1:1
    if sum(in(i,:))==0
        down = down+1;
    else
        break;
    end
end
for i=y:-1:1
    if sum(in(:,i))==0
        right = right+1;
    else
        break;
    end
end
out = imresize(in(up+1:x-down,left+1:y-right),[64,64]);
end