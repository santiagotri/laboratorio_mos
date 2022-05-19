****************************
***      Ejercicio1      ***
****************************
Sets
    t trabajos
        / t1*t4/
          
    m maquinas
        / m1*m4/;

            
Table tiempos(m, t) 
                t1   t2   t3   t4
m1              14   5    8    7
m2              2    12   6    5
m3              7    8    3    9
m4              2    4    6    10;

Variables
  x(m,t) indica que trabajo hace m maquina
  z objective function;
  
alias(n,m);

Binary variable x(m,t);
Equations
objectiveFunction         objective function
res1
res2
;

objectiveFunction                     ..  z =e= sum((m,t),tiempos(m,t)* x(m,t));

res1(m)                               ..  sum ((t), x(m,t))=e=1;

res2(t)                               ..  sum ((m), x(m,t))=e=1;
 

Model model1 /all/ ;
option lp=CPLEX
Solve model1 using mip minimizing z;

Display x.l;
Display z.l;



