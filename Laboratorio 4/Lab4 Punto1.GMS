*************************************************************************
***      Multiobjective case                                          ***
***                                                                   ***
***      Author: Germ�n Montoya                                       ***
*************************************************************************

Sets
  i   network nodes / n1, n2, n3, n4, n5 /

alias(j,i);

scalar e e-constraint / 0 /;

set iter iteraciones /it1*it11/;

parameter e_vec(iter) vector de valores de w1
                 /it1 1, it2 2, it3 3, it4 4, it5 5, it6 6, it7 7, it8 8, it9 9, it10 10, it11 11/;

Table h(i,j) link capacity
                  n1       n2    n3     n4     n5
n1                999       1     1    999    999
n2                999     999   999    999      1
n3                999     999   999      1    999
n4                999     999   999    999      1
n5                999     999   999    999    999;

Table c(i,j) link cost
                 n1      n2      n3      n4      n5
n1               999     10      5       999     999
n2               999     999     999     999     10
n3               999     999     999     5       999
n4               999     999     999     999     5
n5               999     999     999     999     999;


Variables
  x(i,j)      Indicates if the link i-j is selected or not.
  z           Objective function

  f1          funcion 1
  f2          funcion 2;

Binary Variable x;

Equations
objectiveFunction        objective function
sourceNode(i)            source node
destinationNode(j)       destination node
intermediateNode         intermediate node
valor_f1                 resultado f1
valor_f2                 resultado f2
f1constraint             f1constraint

;

valor_f1                                           ..      f1=e= sum((i,j), h(i,j) * x(i,j));

valor_f2                                           ..      f2=e= sum((i,j), c(i,j) * x(i,j));

objectiveFunction                                  ..      z =e= f2;

sourceNode(i)$(ord(i) = 1)                         ..      sum((j), x(i,j)) =e= 1;
   
destinationNode(j)$(ord(j) = 5)                    ..      sum((i), x(i,j)) =e= 1;

intermediateNode(i)$(ord(i) <> 1 and ord(i) ne 5)  ..      sum((j), x(i,j)) - sum((j), x(j,i)) =e= 0;
   
f1constraint                                       ..      f1 =l= e;

Model model1 /all/ ;

option mip=CPLEX;
Solve model1 using mip minimizing z;

display z.l;
display x.l;
display f1.l;
display f2.l;


parameter z_res(iter) "z results to store";

parameter f1_res(iter) "f1 results to store";

parameter f2_res(iter) "f2 results to store";

parameter x_res(i,j,iter) "x results to store";

loop (iter,
    e=e_vec(iter);

    option mip=CPLEX;
    Solve model1 using mip minimizing z;
    z_res(iter)=z.l;
    f1_res(iter)=f1.l;
    f2_res(iter)=f2.l;
    x_res(i,j,iter)=x.l(i,j);

    );

display z_res;
display f1_res;
display f2_res;
display e_vec;
display x_res;

*Modificar ruta.
file GAMSresults /results2.dat/;

put GAMSresults;
loop(iter,
         put iter.tl, @5, f1_res(iter), @18, f2_res(iter) /

         );
