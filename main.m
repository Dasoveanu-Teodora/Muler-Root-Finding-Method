%Dasoveanu Teodora 324AA
clc;
clear;
                              
%f = @(x) sin(2*x)/exp(x)+6*x             % introducem aici functia  careia dorim sa ii aflam radacinile reale

 f = @(x)  (x+9)*(2*x+7)/sqrt(tan(x))


itmax=10;                                %aproximam grosier cate iteratii trebuie
                                          ...facute pentru ca algoritmul sa gaseasaca 
                                           ...cat mai multe radacini
                                                           

[sol]=roots_muller(f,itmax);               %functia apelata retuneaza vectorul de solutii gasite

                                           %Afisare rezultate   
disp('Solutiile gasite: ');
disp(sol);

xlabel(' x ');                             %Organizez fereastra pentru graficul functiei                       
ylabel(' f(x)');
title('Metoda MULLER');

hold on

yline(0);                                  %afisez in fereastra dreapta x=0
xline(0);                                  %afisez dreapta y=0

syms x; 
fplot(f(x),[-10,10]);                      %afisez functia pe un interval ales
plot(sol,0,'b-*');                         %afisez solutiile gasite pentru 
                                           ...o vizualizare cat mai usoara a rezultatului 
hold off
