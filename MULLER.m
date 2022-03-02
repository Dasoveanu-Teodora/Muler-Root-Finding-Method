function [y] = MULLER(f,points)

f2 = @(x1,x2) f(x1)/(x1-x2) + f(x2)/(x2-x1);    %diferenta divizata pt [x1,x2]
f3 = @(x1,x2,x3) f(x1)/((x1-x2)*(x1-x3))+...
                f(x2)/((x2-x1)*(x2-x3))+...
                f(x3)/((x3-x1)*(x3-x2));          %diferenta divizata pt [x1,x2,x3]
                                                            
 N = 1000;                                     %nr de iteratii
 err = 1e-5;                                  % acuratetea
 x(1) = points(1);                            %valoarea initiala pt x_0
 x(2) = points(2);                            %valoarea initiala pt x_1
 x(3) = points(3);                            %valoarea initiala pt x_2
 i = 1;
 for k = 4:N
    %ecutia parabolei sub forma lui Newton: 
    ...y_k(x)=f(x(k-1)) + (x-x(k-1))*f[x(k-1),x(k-2)] + (x - x(k-1))*(x-x(k-2))
    ... sau  y_k(x)=f(x(k-1)) + w*(x-x(k-1)) + (x - x(k-1))^2*f[x(k-1),x(k-2)]
     w = f2(x(k-1),x(k-2)) + f2(x(k-1),x(k-3)) - f2(x(k-2),x(k-3));       
     sol1=(w + sqrt(w^2 - 4*f(x(k-1))*f3(x(k-1),x(k-2),x(k-3))));          %solutia 1
     sol2=(w - sqrt(w^2 - 4*f(x(k-1))*f3(x(k-1),x(k-2),x(k-3))));           %solutia 2
     numi = max(sol1,sol2);                    
     x(k) = x(k-1) - 2*f(x(k-1))/numi;        %relatia de recurenta prin intermediul careia
                                               ...calculam intersectia parabolei cu axa Ox
                                               ... ce reperezinta radacina aproximata    

     if  abs(x(k)-x(k-1)) < err               %   verificam daca distanta dintre cele doua puncte
                                               ... este suficient de mica  
               break;
     end
     
     i=i+1;

 end
 
 y=x(k);                                      %returnam radacina aproximata gasita 

end