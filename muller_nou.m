function [root] = muller_nou(f,points)
 error = 100;
 tol =1e-5;
 x1 = points(1);                            %valoarea initiala pt x_0
 x2 = points(2);                            %valoarea initiala pt x_1
 x3 = points(3);
 k=0;
while error>tol
    k=k+1;
    y1 = f(x1)
    y2 = f(x2)
    y3 = f(x3)
    c1 = (y2-y1)/(x2-x1);
    c2 = (y3-y2)/(x3-x2);
    d1 = (c2-c1)/(x3-x1);
    s = c2 + d1*(x3-x2);
    sol1 = x3 - 2*y3/(s + sqrt(s^2-4*y3*d1));
    sol2 = x3 - 2*y3/(s - sqrt(s^2-4*y3*d1));
   x4=max(sol1,sol2); 
    error = abs(f(x4));
    x1 = x2;
    x2 = x3;
    x3 = x4;
    disp('RADACINA');
    disp(x4);
    
end
   root = x4;
   
end