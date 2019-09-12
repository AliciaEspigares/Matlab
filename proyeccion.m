function resultado=proyeccion()
dim = input('Dimensión del espacio ambiente: ');
dimSub = input('Dimensión del subespacio donde se efectúa la proyección: ');
baseSub = input('Introduce una matriz cuyas filas sean una base del subespacio: ');
vector = input('Introduce el vector que quieras proyectar como un vector fila: ');

%Usamos orth para ortonormalizar la base dada por el usuario
baseOrtonormal = orth(baseSub');

%Creamos un vector columna de ceros con dim filas que usaremos como base
%de nuestro sumatorio
proy=zeros(dim,1);

%Realizamos tantas iteraciones como dimensiones tenga el subespacio deseado
for n=1:dimSub
    proy=proy + (vector*baseOrtonormal(:,n))*baseOrtonormal(:,n); 
end

%Devolvemos el resultado como vector fila
resultado=proy';

%El resultado para el enunciado propuesto es el vector:
    %0.0735 0.4030 1.1546 1.2797 0.6490