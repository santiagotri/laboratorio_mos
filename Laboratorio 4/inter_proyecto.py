##
import tkinter as tk
#Creación de la ventana
ventana= tk.Tk()
ventana.geometry("900x600")
etiqueta = tk.Label(ventana,text="Modelo neuronal de Izhikevich",bg="lightskyblue")
etiqueta.pack(fill=tk.X)
#etiqueta estimulación
etiqueta_2=tk.Label(ventana,text="Estimulación: ")
etiqueta_2.place(x=500,y=50,width=100,height=30)
var_slider = tk.IntVar()
slider = tk.Scale(ventana,from_=-100, to= 100, length=280, orient=tk.HORIZONTAL, showvalue=0, variable=var_slider)
slider.place(x=550,y=80)
lbl_0=tk.Label(ventana,text="0mA")
lbl_neg100=tk.Label(ventana,text="-100mA")
lbl_100=tk.Label(ventana,text="100mA")
lbl_neg100.place(x=500,y=80, width=50)
lbl_100.place(x=550+280,y=80, width=50)
lbl_0.place(x=550+110,y=100, width=50)
#Etiqueta tiempo de simulación
tiempo_simulacion=tk.Label(ventana,text="Tiempo de simulación: ")
tiempo_simulacion.place(x=507,y=140,width=200,height=20)
caja_texto1=tk.Entry(ventana)
caja_texto1.place(x=680,y=140,width=30,height=20)
#etiqueta ms
ms1=tk.Label(ventana,text="ms")
ms1.place(x=715,y=140,width=30,height=20)
#Etiqueta tiempo de inicio estimulación
t_inicio=tk.Label(ventana,text="Tiempo de inicio de estimulación:  ")
t_inicio.place(x=460,y=180,width=230,height=20)
caja_texto2=tk.Entry(ventana)
caja_texto2.place(x=680,y=180,width=30,height=20)
#etiqueta ms
ms2=tk.Label(ventana,text="ms")
ms2.place(x=715,y=180,width=30,height=20)
#Etiqueta tiempo de fin estimulación
t_fin=tk.Label(ventana,text="Tiempo de fin de estimulación:  ")
t_fin.place(x=482,y=220,width=200,height=20)
caja_texto3=tk.Entry(ventana)
caja_texto3.place(x=680,y=220,width=30,height=20)
#etiqueta ms
ms3=tk.Label(ventana,text="ms")
ms3.place(x=715,y=220,width=30,height=20)
#Etiqueta valor de estimulación
v_est=tk.Label(ventana,text="Valor de estimulación:  ")
v_est.place(x=505,y=260,width=200,height=20)
caja_texto4=tk.Entry(ventana, textvariable=var_slider)
caja_texto4.place(x=680,y=260,width=30,height=20)
#etiqueta mA
ms4=tk.Label(ventana,text="mA")
ms4.place(x=715,y=260,width=30,height=20)
#boton cargar
boton_cargar=tk.Button(ventana,text="Cargar",bg="lightskyblue")#,command=sale para que es el boton)
boton_cargar.place(x=700,y=300,width=100,height=30)
#boton simular
boton_sim=tk.Button(ventana,text="Simular",bg="lightskyblue")
boton_sim.place(x=600,y=500,width=100,height=30)
#boton exportar
boton_exp=tk.Button(ventana,text="Exportar",bg="Lightskyblue")
boton_exp.place(x=730,y=500,width=100,height=30)
#etiqueta metodo solución
met=tk.Label(ventana,text="Método de solución: ")
met.place(x=40,y=300,width=200,height=30)
var_radio = tk.IntVar()
metodo1 = tk.Radiobutton(ventana, text="Runge-Kutta 2", variable=var_radio, value=1).place(x=40,y=350,width=200,height=30)
metodo2 = tk.Radiobutton(ventana, text="Runge-Kutta 4", variable=var_radio, value=2).place(x=40,y=350 + 1*30,width=200,height=30)
metodo3 = tk.Radiobutton(ventana, text="Euler Adelante", variable=var_radio, value=3).place(x=40,y=350 + 2*30,width=200,height=30)
metodo4 = tk.Radiobutton(ventana, text="Euler Atrás", variable=var_radio, value=4).place(x=40,y=350 + 3*30,width=200,height=30)
metodo5 = tk.Radiobutton(ventana, text="Euler Modificado", variable=var_radio, value=5).place(x=40,y=350 + 4*30,width=200,height=30)
#Etiqueta variables
var=tk.Label(ventana,text="Variables: ")
var.place(x=200,y=300,width=200,height=30)
chkValue =tk.BooleanVar()
chkValue.set(True)
chk_V=tk.Checkbutton(ventana,text="V(t)",var=chkValue)
chk_V.place(x=265,y=330,width=50,height=30)
chkValue =tk.BooleanVar()
chkValue.set(True)
chk_u=tk.Checkbutton(ventana,text="u(t)",var=chkValue)
chk_u.place(x=265,y=360,width=50,height=30)
#Etiqueta parámetros
par=tk.Label(ventana,text="Parámetros:")
par.place(x=200,y=420,width=200,height=30)
par_a=tk.Label(ventana,text="a")
par_a.place(x=180,y=450,width=200,height=30)
caja_textoa=tk.Entry(ventana)
caja_textoa.place(x=300,y=453,width=90,height=20)
par_b=tk.Label(ventana,text="b")
par_b.place(x=235,y=478,width=90,height=20)
caja_textob=tk.Entry(ventana)
caja_textob.place(x=300,y=478,width=90,height=20)
par_c=tk.Label(ventana,text="c")
par_c.place(x=235,y=503,width=90,height=20)
caja_textoc=tk.Entry(ventana)
caja_textoc.place(x=300,y=503,width=90,height=20)
par_d=tk.Label(ventana,text="d")
par_d.place(x=235,y=528,width=90,height=20)
caja_textod=tk.Entry(ventana)
caja_textod.place(x=300,y=528,width=90,height=20)
#Etiqueta valores predefinidos
valores=tk.Label(ventana,text="Valores predefinidos:")
valores.place(x=370,y=300,width=200,height=30)
#boton de salida
boton_salida=tk.Button(ventana,text="X",bg="red")
boton_salida.place(x=860,y=20,width=40,height=30)
ventana.mainloop()

##

