function [roots]=roots(f,itmax)
i=1;
x0=1;
x1=2;
x2=1.5;
while i<=itmax
    i=i+1;
    points=[x0 x1 x2];
    roots(i)=muller_nou(f,points);
    x0=x1;
    x1=x2;
    x2=roots(i);
    
end