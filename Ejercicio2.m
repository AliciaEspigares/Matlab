%Ejercicio nº 2

clear
%Definimos primero los parámetros que de la expresión cartesiana
syms x y z t real;
%Introducimos los valores de las matrices del enunciado. 
%El endomorfismo en R4 es la matriz A mientras que la base en la que está
%expresada en la matriz B
A=[1 2 -6 0; 0 10 -16 -1; 1 3 1 -4;1 3 -3 0];
B=[12 3 1 0; 0 1 0 5; 0 0 5 7; 0 0 0 1];
%Calculamos su función
P=B*A*inv(B);
%Creamos el vector de parámetros cartesianos
Parametros=[x y z t]';
%Multiplicando la función por los parámetros cartesianos obtenemos la
%función cartesiana
H=P*Parametros;

%Para el siguiente apartado necesitamos resolver la ecuación cartesiana.
M=solve([H(1)==0,H(2)==0,H(3)==0,H(4)==0],[x,y,z,t]);
%Solución del sistema
M.x,M.y,M.z,M.t;
%Puesto que las soluciones son 0, quiere decir que el núcleo es 0 y por el
%teorema de la dimensión la imagen es R4

disp('A) La expresión cartesiana es:')
H
disp('B) El núcleo es 0 y la imagen R4')

disp('C) El tipo de endomorfismo es inyectivo')
