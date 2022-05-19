*************************************************************************
***                                                                   ***
***      Author: Gabriel Beltran                                      ***
***      Author: Andres Triana                                        ***
*************************************************************************
Sets
  i      zonas /z1*z12/
alias(j,i)
Parameter c(i,j) link cost;
c(i,j)=999;
*Costos Grafo Dirigido.
c('z1','z3')=1;
c('z1','z2')=1;
c('z1','z5')=1;
c('z3','z4')=1;
c('z3','z5')=1;
c('z3','z6')=1;
c('z3','z7')=1;
c('z3','z8')=1;
c('z11','z5')=1;
c('z11','z4')=1;
c('z11','z6')=1;
c('z11','z8')=1;
c('z11','z9')=1;
c('z11','z10')=1;
c('z9','z10')=1;
c('z9','z8')=1;
c('z9','z12')=1;
c('z4','z6')=1;
c('z4','z5')=1;
c('z10','z5')=1;
c('z8','z6')=1;
c('z8','z7')=1;
c('z7','z12')=1;
c('z2','z5')=1;
c('z8','z12')=1;

*Costos Grafo NO Dirigido.
loop((i,j),
    if (c(i,j)<999,
        c(j,i)=c(i,j);
    );
);




Variables
x(i)                     Indicates if the zone i is selected or not.
z                        Objective function
;

Binary Variable x;

Equations
objectiveFunction                        objective function


allCovered(i)                            Todas las zonas son o tienen un vecino cubierto

;

objectiveFunction       ..      z =e= sum((i), x(i));


allCovered(i)           ..      sum((j),x(j)$(c(i,j) = 1))+x(i) =g= 1  ;



Model model1 /all/ ;

option mip=SCIP;
Solve model1 using mip minimizing z;


Display x.l;
Display z.l;


