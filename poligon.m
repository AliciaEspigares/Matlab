function poligon()
n=input('Introduce el n�mero de lados del pol�gono: ');
r=input('Introduce el radio del pol�gono: ');
p=input('Introduce la abscisa del centro del pol�gono: ');
q=input('Introduce la ordenada del centro del pol�gono: ');
a=input('Introduce el coeficiente -a- de la recta: ');
b=input('Introduce el coeficiente -b- de la recta: ');
c=input('Introduce el coeficiente -c- de la recta: ');

%Declaramos A global para que regular.m pueda escribir sobre ella tambi�n
global A;

%Llamamos a los dos scripts restantes
regular(n,r,p,q);
refleja(A,a,b,c);
