%Dibuja un n�mero determinado de pol�gonos regulares de 4 lados centrados
%en el origen con todos sus v�rtices igualmente separados y uno de sus
%vertices se situa en el punto (0,5);
function holi()
%Establecemos los par�metros que queremos que tenga el pol�gono.
lados=4;
radio=7.071/sqrt(2);
p=0;
q=0;
angle = 2*pi/lados;
theta = 0;
for n = 1:lados
theta = theta + angle;
[x,y] = pol2cart(theta,radio);
A(:,n) = [x;y] ;
end
A = A(:,1:n);

%Realizamos X rectas a lo largo del primer cuadrante para realizar el sim�trico del
%polinomio anteriormente creado respecto a dichas rectas y lo repetimos las
%veces necesarias para obtener la cantidad de repeticiones que el usuario
%requiere.

%Aqu� realizamos la primera recta.
x=[-2:0.1:2];
y=1000*x;
p=input('Indica el n�mero de veces que desea que se repita el cuadrado\n');
pe=p-1;
figure (2),  axis([-5,5,-5,5]), axis equal, hold on
%Aqu� realizamos las dem�s rectas.
for i=0:pe
    ang=90/p;
    m=ang*i;
    a=tand(m);
    x=[-2:0.1:2];
    c=0;
    b=-1;
    y=a*x;
    hold on
    
%Aqu� hacemos el sim�trico del polin�mio respecto a dicha recta.

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
     
%Aqu� representamos la figura original y la figura reflejada
    y=a*x ;
    plot(Q(1,:),Q(2,:),'b')
    hold off
    
%Con el for repetimos el proceso las veces requeridas para formar todos los
%polinomios
end
end
