%EJERCICIO 3
%Definimos los vértices del triángulo y los almacenamos en la matriz
%Triangulo
Triangulo=([14 3;11 4.73;11 1.26;14 3]');
%Lo convertimos en coordenadas homogéneas
CH=homo(Triangulo);
%Trasladamos al origen
T=tras(-14,-3);
A=T*CH;
%Definimos las matriz de rotación con la que vamos a girar el triángulo 60º
syms alpha real
Rotacion=[cos(alpha) -sin(alpha) 0; sin(alpha) cos(alpha) 0; 0 0 1];
%Definimos el ángulo de rotación
alpha=pi/3; 
%Evaluamos la matriz de rotación con el ángulo de 60º
Rot_angulos=eval(Rotacion);
%Multiplicamos el triángulo en homogéneas por la matriz de rotación
Tri_Girado=Rot_angulos*A;
%Devolvemos al centro que nos dice el enunciado
T1=tras(14,3);
Tri_Centro=T1*Tri_Girado;

%Pasamos de nuevo a coordenadas normales 
invhomo(Tri_Centro);
%El algoritmo de Householder se utiliza para la simetría
syms alpha real
u=[cos(alpha) sin(alpha)]';
v=[-sin(alpha) cos(alpha)]';
H = eye(2)-2*u*u';
simetria = homo(H);
%Ángulo para la simetría
alpha=-pi/2-pi/4;
u1=eval(u); 
v1=eval(v);

%La matriz de traslación respecto a la recta
Matriz_Traslacion=[1 1 1 1; 0 0 0 0]*5 + [0 0 0 0;1 1 1 1]*0;
Tri_Centro(3,:)=[]; %Quitamos la fila que no es necesaria para que las 
%dimensiones de las matrices concuerden
%Calculamos el triángulo simétrico
Simetria_Triangulo = eval(H*(Tri_Centro+Matriz_Traslacion))-Matriz_Traslacion;
%Dibujamos los triángulos, el inicial, el girado y el simétrico mediante el
%script PlotFiguras
Plotfiguras(Triangulo,Tri_Centro,Simetria_Triangulo);
grid on
%Dibujamos la recta para observar bien la simetría del triángulo
x= [-10:0.1:10];
y=(-x-5);
plot(x,y,'r')  

