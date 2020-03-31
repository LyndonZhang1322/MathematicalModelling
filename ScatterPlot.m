clear;

x1 = 1;

while x1<12
    S = AverageMove3(11,x1,x1);
    y1 = S(2);
    scatter(x1,y1) 
    hold on
    x1 = x1+1;
end