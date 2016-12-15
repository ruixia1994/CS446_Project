function resadd(dots)
global posMatrix adjMatrix
[l,c] = size(dots);
[n,c] = size(posMatrix);
for i=1:l
    if(n==0)
        posMatrix = [dots(i,1),dots(i,2);dots(i,3),dots(i,4)];
        adjMatrix = [0,1;1,0];
        n=2;
    else
        A = 0;
        B = 0;
        for j = 1:n
            if(posMatrix(j,:)==[dots(i,1),dots(i,2)])
                A = j;
            end
            if(posMatrix(j,:)==[dots(i,3),dots(i,4)])
                B = j;
            end
        end
        if(A==0 & B==0)                         %2 existed points 
            posMatrix = [posMatrix;[dots(i,1),dots(i,2)];[dots(i,3),dots(i,4)]];
            adjMatrix = [[adjMatrix,zeros(n,2)];zeros(2,n+2)];
            A = n+1;
            B = n+2;
            n = n+2;
        elseif(A==0 & B~=0)                      %B existed
            posMatrix = [posMatrix;[dots(i,1),dots(i,2)]];
            adjMatrix = [[adjMatrix,zeros(n,1)];zeros(1,n+1)];
            n = n+1;
            A = n;
        elseif(A~=0 & B==0)                      %A existed
            posMatrix = [posMatrix;[dots(i,3),dots(i,4)]];
            adjMatrix = [[adjMatrix,zeros(n,1)];zeros(1,n+1)];
            n = n+1;
            B = n;
        end
        adjMatrix(A,B) = 1;                 %Adjust the adjacent Matrix
        adjMatrix(B,A) = 1;
    end
end
end