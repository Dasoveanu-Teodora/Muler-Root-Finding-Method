function [radacini]=roots_muller(f,itmax)
i=1;

x0=rand(1,1);                          
x1=rand(1,1);                               %initializam  punctele cu ajutorul carora vom afla prin interpolare cuadrica
x2=rand(1,1);                               ... parabola ce trece prin cele trei puncte de pe graficul functiei 

points=[x0 x1 x2];                                                         
                                            %apelez instructiunea
                                            ...repetitiva pentru a
                                            ... afla cat mai multe radacini
while i < itmax
     
     radacini(i)=MULLER(f,points);           
    
     x0=rand(1,1)*20-10;             %  *20-10 pentru a se genera si numere negative
     x1=rand(1,1)*20-10;
     x2=rand(1,1)*20-10;     
  
     points=[x0 x1 x2];
     i=i+1;  
end