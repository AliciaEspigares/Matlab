function poligon()
n=input('Introduce el número de lados del polígono: ');
r=input('Introduce el radio del polígono: ');
p=input('Introduce la abscisa del centro del polígono: ');
q=input('Introduce la ordenada del centro del polígono: ');
a=input('Introduce el coeficiente -a- de la recta: ');
b=input('Introduce el coeficiente -b- de la recta: ');
c=input('Introduce el coeficiente -c- de la recta: ');

%Declaramos A global para que regular.m pueda escribir sobre ella también
global A;

%Llamamos a los dos scripts restantes
regular(n,r,p,q);
refleja(A,a,b,c);
