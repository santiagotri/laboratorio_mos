****************************
***      Ejercicio2      ***
****************************
Sets
    i origen
        / o1*o3/
          
    j destino
        / d1*d4/;

           
Parameter a(i) /o1 300, o2 500, o3 200/;
Parameter b(j) /d1 200, d2 300, d3 100, d4 400/ ;

Table costos(i, j) 
                d1   d2   d3   d4
o1              8    6    10   9
o2              9    12   13   7
o3              14   9    16   5;

Variables
  x(i,j) indica la cantidad de procesos por procesador
  z objective function;
  

Positive variable x(i,j);
Equations
objectiveFunction         objective function
res1
res2
;

objectiveFunction                     ..  z =e= sum((i,j),costos(i,j)* x(i,j));

res1(i)                               ..  sum ((j), x(i,j))=l=a(i);

res2(j)                               ..  sum ((i), x(i,j))=e=b(j);
 

Model model1 /all/ ;
option lp=CPLEX
Solve model1 using lp minimizing z;

Display x.l;
Display z.l;



