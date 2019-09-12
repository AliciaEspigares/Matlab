function refleja(A,a,b,c)
%Refleja un conjunto de puntos respecto a la recta ax + by + c = 0
%que no pasa por el origen
%Evaluamos el n�mero de columnas de la matriz de puntos A
k=size(A,2);
%Llenamos la �ltima fila de A con unos
B=[A;ones(1,k)];
%Ponemos el opuesto del vector de traslaci�n en homog�neas
v=[0;c/b;1];
%Construimos las dos primeras columnas de la matriz de traslaci�n
N=[1 0;0 1;0 0];
%Completamos la matriz de traslaci�n
M=[N,v];
%Efectuamos la traslaci�n al origen
Ao=M*B;
%Quitamos la tercera fila de unos
Ao(3,:)=[];
%Sacamos el �ngulo de inclinaci�n de la recta ax + by + c = 0
alpha = atan(-a/b);
%Construyo la matriz de Householder
H=[cos(2*alpha) sin(2*alpha);sin(2*alpha) -cos(2*alpha)];
%Reflejamos los puntos respecto a la recta ax + by = 0
S=H*Ao;
%Llenamos la �ltima fila de S con unos
U=[S;ones(1,k)];
%Ponemos el vector de traslaci�n en homog�neas
w=[0;-c/b;1];
%Completamos la matriz de traslaci�n que lleva a la posici�n original
Ma=[N,w];
%Trasladamos los puntos
AR=Ma*U;
%Quitamos la tercera fila de unos (no es indispensable)
AR(3,:)=[];
%A�adimos a A la primera columna para poder cerrar la gr�fica
P=[A,A(:,1)];
%A�adimos a AR la primera columna para poder cerrar la gr�fica
Q=[AR,AR(:,1)];
x=[-3:0.1:3]; y=(-a/b)*x + (-c/b);
%Representamos la figura original, la recta y la figura reflejada
figure (2), plot(P(1,:),P(2,:)), axis([-7,7,-5,9]), 
axis equal, hold on, plot(x,y,'r'), plot(Q(1,:),Q(2,:),'g'),
hold off




