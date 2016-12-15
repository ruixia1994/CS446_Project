function [x,y] = next(i,j)
global graph mark
if(graph(i-1,j)==1)
    x = i-1;
    y = j;
elseif(graph(i+1,j)==1)
    x = i+1;
    y=j;
elseif(graph(i,j-1)==1)
    x = i;
    y = j-1;
elseif(graph(i,j+1)==1)
    x = i;
    y = j+1;
elseif(graph(i-1,j-1)==1)
    x = i-1;
    y=j-1;
elseif(graph(i-1,j+1)==1)
    x = i-1;
    y=j+1;
elseif(graph(i+1,j-1)==1)
    x = i+1;
    y=j-1;
elseif(graph(i+1,j+1)==1)
    x = i+1;
    y=j+1;
else
    x = -1;
    y = -1;
end
end