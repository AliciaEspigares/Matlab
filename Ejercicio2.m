%Ejercicio n� 2

clear
%Definimos primero los par�metros que de la expresi�n cartesiana
syms x y z t real;
%Introducimos los valores de las matrices del enunciado. 
%El endomorfismo en R4 es la matriz A mientras que la base en la que est�
%expresada en la matriz B
A=[1 2 -6 0; 0 10 -16 -1; 1 3 1 -4;1 3 -3 0];
B=[12 3 1 0; 0 1 0 5; 0 0 5 7; 0 0 0 1];
%Calculamos su funci�n
P=B*A*inv(B);
%Creamos el vector de par�metros cartesianos
Parametros=[x y z t]';
%Multiplicando la funci�n por los par�metros cartesianos obtenemos la
%funci�n cartesiana
H=P*Parametros;

%Para el siguiente apartado necesitamos resolver la ecuaci�n cartesiana.
M=solve([H(1)==0,H(2)==0,H(3)==0,H(4)==0],[x,y,z,t]);
%Soluci�n del sistema
M.x,M.y,M.z,M.t;
%Puesto que las soluciones son 0, quiere decir que el n�cleo es 0 y por el
%teorema de la dimensi�n la imagen es R4

disp('A) La expresi�n cartesiana es:')
H
disp('B) El n�cleo es 0 y la imagen R4')

disp('C) El tipo de endomorfismo es inyectivo')
