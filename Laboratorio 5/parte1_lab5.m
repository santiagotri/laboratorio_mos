clc, clear all, close all

syms f_x x;

f_x=x.^5 - 8*x.^3 + 10*x + 6;

figure
ezplot(f_x)
hold on;
title('Parte 1 lab 5');

axis([-3 3 -10 20]);

x_i=-2.5;  %valor inicial
x_i_max=2.5;

d1_f_x=diff(f_x); %primera derivada
d2_f_x=diff(d1_f_x); %segunda derivada

d1_f_x_i=double(subs(d1_f_x, x, x_i));

convergencia=0.001;  % convergencia VALOR ORIGIANL 0.001

a=0.1;
%disp("a: "+a)
maximos = [];
minimos = [];
maximos_y = [];
minimos_y = [];

cont=1;
while x_i<x_i_max
    while abs(d1_f_x_i)>convergencia && x_i<x_i_max
        cont=cont+1;       
    
        d1_f_x_i=double(subs(d1_f_x,x_i)); %Primera derivada evaluada en x_i

        %disp("Primera derivada : "+d1_f_x_i);
    
        d2_f_x_i=double(subs(d2_f_x,x_i)); %Segunda derivada evaluada en x_i
    
        x_i_new=x_i - a*(d1_f_x_i/d2_f_x_i); %Expresión de Newton Raphson: x(i+1) = x(i) - a*f'(x(i))/f''(x(i))
      
        x_i=x_i_new;  %Actualizamos el x_i
    
        f_x_i=double(subs(f_x,x_i)); %Evaluamos el x_i en la f(x) para graficar posteriormente
    
        plot(x_i, f_x_i, 'og');

        %disp("Graficando x, y: "+x_i +", "+ f_x_i)
    end
    x_i = x_i+a;
    d2_f_x_i=double(subs(d2_f_x,x_i)); %Segunda derivada evaluada en x_i
    %disp("Buscando punto de inflexión: "+d2_f_x_i + " con " + x_i)
    if d2_f_x_i<0
        maximos = [maximos x_i-a];
        maximos_y = [maximos_y f_x_i];
        while d2_f_x_i<0 && x_i<x_i_max
            x_i=x_i+a;  %Actualizamos el x_i
            d2_f_x_i=double(subs(d2_f_x,x_i)); %Segunda derivada evaluada en x_i
        end
    else
        minimos = [minimos x_i-a];
        minimos_y = [minimos_y f_x_i-a];
        while d2_f_x_i>0 && x_i<x_i_max
            x_i=x_i+a;  %Actualizamos el x_i
            d2_f_x_i=double(subs(d2_f_x,x_i)); %Segunda derivada evaluada en x_i
        end
    end
    %disp("Punto de inflexión encontrado: "+d2_f_x_i+ " con " + x_i);
    d1_f_x_i=double(subs(d1_f_x,x_i));
    %disp("Reiniciando : "+x_i +", "+ d1_f_x_i);
end

maximo_y = -9999;
maximo_x = -9999;
disp("Maximos (circulos rojos):");
for i=1:length(maximos)
    disp("("+maximos(i)+","+maximos_y(i)+")");
    plot(maximos(i),maximos_y(i),'or')
    if maximos_y(i)>maximo_y
        maximo_y = maximos_y(i);
        maximo_x = maximos(i);
    end
end
disp("Maximo global (señalado con texto): ("+ maximo_x+ ", " +maximo_y+")")
text(maximo_x,maximo_y,'\leftarrow Maximo global','FontSize',10);

minimo_y = 9999;
minimo_x = 9999;
disp("Minimos (cuadrados negros):");
for i=1:length(minimos)
    disp("("+minimos(i)+","+minimos_y(i)+")");
    plot(minimos(i),minimos_y(i),'sk')
    if minimos_y(i)<minimo_y
        minimo_y = minimos_y(i);
        minimo_x = minimos(i);
    end
end
disp("Minimo global (señalado con texto): ("+ minimo_x+ ", " +minimo_y +")")
text(minimo_x,minimo_y,'\leftarrow Minimo global','FontSize',10);
