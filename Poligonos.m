%Dibuja un número determinado de polígonos regulares de 4 lados centrados
%en el origen con todos sus vértices igualmente separados y uno de sus
%vertices se situa en el punto (0,5);
function holi()
%Establecemos los parámetros que queremos que tenga el polígono.
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

%Realizamos X rectas a lo largo del primer cuadrante para realizar el simétrico del
%polinomio anteriormente creado respecto a dichas rectas y lo repetimos las
%veces necesarias para obtener la cantidad de repeticiones que el usuario
%requiere.

%Aquí realizamos la primera recta.
x=[-2:0.1:2];
y=1000*x;
p=input('Indica el número de veces que desea que se repita el cuadrado\n');
pe=p-1;
figure (2),  axis([-5,5,-5,5]), axis equal, hold on
%Aquí realizamos las demás rectas.
for i=0:pe
    ang=90/p;
    m=ang*i;
    a=tand(m);
    x=[-2:0.1:2];
    c=0;
    b=-1;
    y=a*x;
    hold on
    
%Aquí hacemos el simétrico del polinómio respecto a dicha recta.

    %Evaluamos el número de columnas de la matriz de puntos A
    k=size(A,2);
    %Llenamos la última fila de A con unos
    B=[A;ones(1,k)];
    %Ponemos el opuesto del vector de traslación en homogéneas
    v=[0;c/b;1];
    %Construimos las dos primeras columnas de la matriz de traslación
    N=[1 0;0 1;0 0];
    %Completamos la matriz de traslación
    M=[N,v];
    %Efectuamos la traslación al origen
    Ao=M*B;
    %Quitamos la tercera fila de unos
    Ao(3,:)=[];
    %Sacamos el ángulo de inclinación de la recta ax + by + c = 0
    alpha = atan(-a/b);
    %Construyo la matriz de Householder
    H=[cos(2*alpha) sin(2*alpha);sin(2*alpha) -cos(2*alpha)];
    %Reflejamos los puntos respecto a la recta ax + by = 0
    S=H*Ao;
    %Llenamos la última fila de S con unos
    U=[S;ones(1,k)];
    %Ponemos el vector de traslación en homogéneas
    w=[0;-c/b;1];
    %Completamos la matriz de traslación que lleva a la posición original
    Ma=[N,w];
    %Trasladamos los puntos
    AR=Ma*U;
    %Quitamos la tercera fila de unos (no es indispensable)
    AR(3,:)=[];
    %Añadimos a A la primera columna para poder cerrar la gráfica
    P=[A,A(:,1)];
    %Añadimos a AR la primera columna para poder cerrar la gráfica
    Q=[AR,AR(:,1)];
     
%Aquí representamos la figura original y la figura reflejada
    y=a*x ;
    plot(Q(1,:),Q(2,:),'b')
    hold off
    
%Con el for repetimos el proceso las veces requeridas para formar todos los
%polinomios
end
end
