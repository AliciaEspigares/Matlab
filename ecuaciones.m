function ecuaciones()
%Este script resuelve sistemas de ecuaciones ecuaciones 

%Introducimos la matriz principal en el sistema y le asignamos una variable
A=input('Escriba la matriz principal entre corchetes y con cada número separado por un espacio y cada fila separada por punto y coma\n'); 

%Introducimos los términos independientes en el sistema y le asignamos una
%variable
b=input('Escriba los términos independientes de la matriz separados con punto y coma\n');

%Obtenemos la longitudo de la matriz de los términos independientes
n=length(b);

%Obtenemos el determinante de la matriz principal
d=det(A);

%Creamos una matriz de ceros con las mismas filas que la matriz de los
%términos independientes
x=zeros(n,1);

%Calculamos la solución
for i=1:n
    Ab=[A(:,1:i-1),b,A(:,i+1:n)];
    x(i)=det(Ab)/d;
end

%Mostramos la solución por pantalla
disp('Solución')
disp(x);
end