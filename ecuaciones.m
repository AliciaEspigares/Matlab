function ecuaciones()
%Este script resuelve sistemas de ecuaciones ecuaciones 

%Introducimos la matriz principal en el sistema y le asignamos una variable
A=input('Escriba la matriz principal entre corchetes y con cada n�mero separado por un espacio y cada fila separada por punto y coma\n'); 

%Introducimos los t�rminos independientes en el sistema y le asignamos una
%variable
b=input('Escriba los t�rminos independientes de la matriz separados con punto y coma\n');

%Obtenemos la longitudo de la matriz de los t�rminos independientes
n=length(b);

%Obtenemos el determinante de la matriz principal
d=det(A);

%Creamos una matriz de ceros con las mismas filas que la matriz de los
%t�rminos independientes
x=zeros(n,1);

%Calculamos la soluci�n
for i=1:n
    Ab=[A(:,1:i-1),b,A(:,i+1:n)];
    x(i)=det(Ab)/d;
end

%Mostramos la soluci�n por pantalla
disp('Soluci�n')
disp(x);
end