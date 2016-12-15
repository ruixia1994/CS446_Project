function out = smoth(in)
in = [zeros(1,66);[zeros(64,1),in,zeros(64,1)];zeros(1,66)];
for i=2:65
    for j=2:65
        x0 = in(i,j);
        x1 = in(i,j+1);
        x2 = in(i-1,j+1);
        x3 = in(i-1,j);
        x4 = in(i-1,j-1);
        x5 = in(i,j-1);
        x6 = in(i+1,j-1);
        x7 = in(i+1,j);
        x8 = in(i+1,j+1);
        p1 = (~x0)*((x3||x7)*x1*x5||((x1||x5)*x3*x7));
        p2 = (x0)*(~((~(x3||x7)*((~(x4||x5||x6))||(~(x1||x2||x8)))) || ((~(x1||x5))*((~(x6||x7||x8))||(~(x2||x3||x4))))));
        in(i,j) = p1||p2;
    end
end
out = in(2:65,2:65);
end