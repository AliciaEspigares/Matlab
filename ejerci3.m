%EJERCICIO 3
%Definimos los v�rtices del tri�ngulo y los almacenamos en la matriz
%Triangulo
Triangulo=([14 3;11 4.73;11 1.26;14 3]');
%Lo convertimos en coordenadas homog�neas
CH=homo(Triangulo);
%Trasladamos al origen
T=tras(-14,-3);
A=T*CH;
%Definimos las matriz de rotaci�n con la que vamos a girar el tri�ngulo 60�
syms alpha real
Rotacion=[cos(alpha) -sin(alpha) 0; sin(alpha) cos(alpha) 0; 0 0 1];
%Definimos el �ngulo de rotaci�n
alpha=pi/3; 
%Evaluamos la matriz de rotaci�n con el �ngulo de 60�
Rot_angulos=eval(Rotacion);
%Multiplicamos el tri�ngulo en homog�neas por la matriz de rotaci�n
Tri_Girado=Rot_angulos*A;
%Devolvemos al centro que nos dice el enunciado
T1=tras(14,3);
Tri_Centro=T1*Tri_Girado;

%Pasamos de nuevo a coordenadas normales 
invhomo(Tri_Centro);
%El algoritmo de Householder se utiliza para la simetr�a
syms alpha real
u=[cos(alpha) sin(alpha)]';
v=[-sin(alpha) cos(alpha)]';
H = eye(2)-2*u*u';
simetria = homo(H);
%�ngulo para la simetr�a
alpha=-pi/2-pi/4;
u1=eval(u); 
v1=eval(v);

%La matriz de traslaci�n respecto a la recta
Matriz_Traslacion=[1 1 1 1; 0 0 0 0]*5 + [0 0 0 0;1 1 1 1]*0;
Tri_Centro(3,:)=[]; %Quitamos la fila que no es necesaria para que las 
%dimensiones de las matrices concuerden
%Calculamos el tri�ngulo sim�trico
Simetria_Triangulo = eval(H*(Tri_Centro+Matriz_Traslacion))-Matriz_Traslacion;
%Dibujamos los tri�ngulos, el inicial, el girado y el sim�trico mediante el
%script PlotFiguras
Plotfiguras(Triangulo,Tri_Centro,Simetria_Triangulo);
grid on
%Dibujamos la recta para observar bien la simetr�a del tri�ngulo
x= [-10:0.1:10];
y=(-x-5);
plot(x,y,'r')  

