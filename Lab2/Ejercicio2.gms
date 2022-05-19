*************************************************************************
***      Finding the minimum cost path in a 1-N network scheme        ***
***                                                                   ***
***      Author: Gabriel Beltran                                      ***
***      Author: Andres Triana                                        ***
*************************************************************************
$ontext
Modelo 1-N: Se busca construir un path entre n fuentes y n
 destinos.

Si tiene en cuenta servicios.
Si tiene en cuenta las capacidades de los enlaces.

$offtext

Sets
  i      network nodes /n1, n2, n3, n4, n5, n6, n7/
  int(i) intermediate nodes /n3, n4, n5/
  f      types of flows /f1*f2/
  d(i)   destinations /n6, n7/
  o(i)   origins/n1, n2/;

alias(j,i);

parameter destinations(d) gives set values;
destinations(d) = d.uel;
parameter origins(o) gives set values;
origins(o) = o.uel;
*En destinations se almacenan las posiciones de los nodos destinos con respecto al conjunto i.

Parameter u(i,j) Capacidad del Enlace;
u(i,j)=0;

Parameter c(i,j) link cost;
c(i,j)=999;
*Costos Grafo Dirigido.
c('n1','n3')=1;
c('n1','n4')=1;
c('n2','n3')=1;
c('n2','n4')=1;
c('n3','n4')=1;
c('n3','n5')=1;
c('n3','n6')=1;
c('n4','n5')=1;
c('n4','n7')=1;
c('n5','n6')=1;
c('n5','n7')=1;

*Costos Grafo NO Dirigido.
loop((i,j),
    if (c(i,j)<999,
        c(j,i)=c(i,j);
        u(i,j)=512;
        u(j,i)=512;
    );
);


Parameter  B(f)   Demanda de Ancho de Banda para cada flujo;
B(f)=256;

Variables
x(i,j,f,o,d)                     Indicates if the link i-j is selected or not from o to d.
z                                Objective function
;

Binary Variable x;

Equations
objectiveFunction                        objective function

sourceNode(i,f,o,d)                        Cada flujo tiene un solo origen

destinationNodes(j,f,o,d)                  Cada flujo tiene un solo destino

intermediateNode(int,f,o,d)                intermediate node

capacity(i,j)                            capacity constraint

noRepeatedLink(i,j,f,o,d)                  do not repeat link
;

objectiveFunction                                      ..      z =e= sum((i,j,f,o,d), c(i,j) * x(i,j,f,o,d));

sourceNode(i,f,o,d)$(ord(i) = origins(o))              ..      sum((j), x(i,j,f,o,d)) =e= 1;

destinationNodes(j,f,o,d)$(ord(j)=destinations(d))     ..      sum((i), x(i,j,f,o,d)) =e= 1;

intermediateNode(int,f,o,d)                            ..      sum((j), x(int,j,f,o,d)) - sum((j), x(j,int,f,o,d)) =e= 0;

capacity(i,j)                                          ..      sum((f,o,d), B(f)*x(i,j,f,o,d)) =l= u(i,j);

noRepeatedLink(i,j,f,o,d)                              ..      x(i,j,f,o,d) + x(j,i,f,o,d) =l= 1;


Model model1 /all/ ;

option mip=SCIP;
Solve model1 using mip minimizing z;



Display x.l;
Display z.l;


