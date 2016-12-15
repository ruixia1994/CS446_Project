function out = Hilditch(in)
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
        if x0==1 & x1+x3+x5+x7<4 & x1+x2+x3+x4+x5+x6+x7+x8>=2 & ~x1-~x1*~x2*~x3+~x3-~x3*~x4*~x5+~x5-~x5*~x6*~x7+~x7-~x7*~x8*~x1==1
            in(i,j) = 0;
    end
    end
out = in(2:65,2:65);
end